import 'package:go_router/go_router.dart';

import 'exceptions.dart';
import '../dependency_injection/injection_container.dart';
import '../handle_controller/handle_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

mixin BaseHandleApi {
  /// Read when an error is actually being reported, not when the repository is
  /// built: a repository resolved before the first frame — from `main`, say —
  /// would find no navigator context yet and blow up on construction.
  BuildContext get ctx => getIt<GlobalKey<NavigatorState>>().currentContext!;

  handleError(exception) {
    if (exception.error is FetchDataException) {
      ctx.read<HandleCubit>().errorOperation(
        exception.error.message ?? "Something Wrong",
      );
    }
    //
    else if (exception.error is InvalidInputException) {
      ctx.read<HandleCubit>().errorOperation(
        exception.error.message ?? "Something Wrong",
      );
    }
    //
    else if (exception.error is UnauthorisedException) {
      ctx.read<HandleCubit>().errorOperation(
        exception.error.message ?? "Something Wrong",
      );
   
    }

    if (exception.error is UnPermissionException) {
      ctx.read<HandleCubit>().errorOperation(
        exception.error.message ?? "Something Wrong",
      );
    }
    //
    else if (exception.error is ApiNotRespondingException) {
      ctx.read<HandleCubit>().errorOperation(
        exception.error.message ?? "Something Wrong",
      );
    }
  }
}
