import 'exceptions.dart';
import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import '../dependency_injection/injection_container.dart';
import '../network_info/network_info.dart';

class DioFactory {
  DioFactory._();

  static Dio? dio;
  static Dio getDio() {
    Duration timeOut = const Duration(seconds: 120);

    if (dio == null) {
      dio = Dio();

      dio?.options.headers['Content-Type'] = 'application/json';
      dio?.options.headers['Accept'] = 'application/json';
    

      dio!
        ..options.connectTimeout = timeOut
        ..options.receiveTimeout = timeOut;
      addDioInterceptor();
      return dio!;
    } else {
      return dio!;
    }
  }


  static void addDioInterceptor() {
    dio?.interceptors.addAll([
      PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: false,
        request: true,
        error: true,
        compact: true,
      ),
      NetworkInterceptor(getIt<NetworkInfo>()),

      ApiExceptions(),
    ]);
  }
}

class ApiExceptions extends Interceptor {
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    super.onError(err, handler);

    switch (err.response?.statusCode) {
      case 400:
      case 422:
        throw InvalidInputException(
          err.response?.data['message'] ?? "input error",
        );

      case 401:
        throw UnauthorisedException(err.response?.data['message'] ?? "UnAuth");
      case 403:
        throw UnPermissionException(
          err.response?.data['message'] ?? "UnPermission",
        );

      case 404:
        throw FetchDataException(err.response?.data['message'] ?? "Not Found");

      case 500:
        throw FetchDataException(
          err.response?.data['message'] ?? "server error",
        );
      default:
        throw ApiNotRespondingException("No Internet");
    }
  }
}

class NetworkInterceptor extends Interceptor {
  final NetworkInfo networkInfo;
  NetworkInterceptor(this.networkInfo);

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final isConnected = await networkInfo.isConnected;

    if (!isConnected) {
      return handler.reject(
        DioException(
          requestOptions: options,
          error: ApiNotRespondingException("No Internet Connection"),
          type: DioExceptionType.connectionError,
        ),
      );
    }

    handler.next(options);
  }
}
