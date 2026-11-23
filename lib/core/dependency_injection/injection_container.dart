import 'package:dio/dio.dart';

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:test/core/dependency_injection/injection_container.config.dart';
import 'package:test/featuers/text_analyzer/data/datasource/text_analyzer_datasource.dart';

import '../api/dio_factory.dart';
import '../network_info/network_info.dart';

import 'package:shared_preferences/shared_preferences.dart';

/// Using GetIt for dependency injection with injectable package to generate the code for us
final getIt = GetIt.instance;
@InjectableInit(
  initializerName: 'init', // default
  preferRelativeImports: true, // default
  asExtension: true, // default
)
Future<void> configureDependencies() async => await getIt.init();

@module
abstract class AppModule {
  // Pre-resolve SharedPreferences for efficient use
  @preResolve
  Future<SharedPreferences> get sharedPreferencesInstance async =>
      await SharedPreferences.getInstance();

  // Provide a singleton instance of Dio using DioFactory
  Dio get dio => DioFactory.getDio();

  // Provide singleton instances for various services and dependencies
  @lazySingleton
  NetworkInfo get networkInfo =>
      NetworkInfoImpl(getIt<InternetConnectionChecker>());

  @lazySingleton
  InternetConnectionChecker get internetConnectionChecker =>
      InternetConnectionChecker();

  @lazySingleton
  GlobalKey<NavigatorState> get navigatorKey => GlobalKey<NavigatorState>();
}

@module
abstract class DataResourcesModule {
  // Provide a singleton instance of AuthDataResource

  // Runs the text analysis in a background isolate
  @lazySingleton
  TextAnalyzerDataResource get textAnalyzerDataResource =>
      TextAnalyzerDataResource();

}
