// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes

import 'package:dio/dio.dart' as _i361;
import 'package:flutter/material.dart' as _i409;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:internet_connection_checker/internet_connection_checker.dart'
    as _i973;
import 'package:shared_preferences/shared_preferences.dart' as _i460;

import '../../featuers/text_analyzer/data/datasource/text_analyzer_datasource.dart'
    as _i1010;
import '../../featuers/text_analyzer/data/repository/text_analyzer_repository_impl.dart'
    as _i569;
import '../../featuers/text_analyzer/domain/repository/text_analyzer_repository.dart'
    as _i1054;
import '../../featuers/text_analyzer/domain/usecase/analyze_text_usecase.dart'
    as _i528;
import '../../featuers/text_analyzer/presentation/bloc/text_analyzer_bloc.dart'
    as _i547;
import '../handle_controller/handle_cubit.dart' as _i99;
import '../network_info/network_info.dart' as _i845;
import 'injection_container.dart' as _i809;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  Future<_i174.GetIt> init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final appModule = _$AppModule();
    final dataResourcesModule = _$DataResourcesModule();
    await gh.factoryAsync<_i460.SharedPreferences>(
      () => appModule.sharedPreferencesInstance,
      preResolve: true,
    );
    gh.factory<_i361.Dio>(() => appModule.dio);
    gh.factory<_i99.HandleCubit>(() => _i99.HandleCubit());
    gh.lazySingleton<_i845.NetworkInfo>(() => appModule.networkInfo);
    gh.lazySingleton<_i973.InternetConnectionChecker>(
      () => appModule.internetConnectionChecker,
    );
    gh.lazySingleton<_i409.GlobalKey<_i409.NavigatorState>>(
      () => appModule.navigatorKey,
    );
    gh.lazySingleton<_i1010.TextAnalyzerDataResource>(
      () => dataResourcesModule.textAnalyzerDataResource,
    );
    gh.lazySingleton<_i1054.TextAnalyzerRepository>(
      () => _i569.TextAnalyzerRepositoryImp(
        gh<_i1010.TextAnalyzerDataResource>(),
      ),
    );
    gh.lazySingleton<_i528.AnalyzeTextUsecase>(
      () => _i528.AnalyzeTextUsecase(gh<_i1054.TextAnalyzerRepository>()),
    );
    gh.factory<_i547.TextAnalyzerBloc>(
      () => _i547.TextAnalyzerBloc(
        analyzeTextUsecase: gh<_i528.AnalyzeTextUsecase>(),
      ),
    );
    gh.lazySingleton<_i845.NetworkInfoImpl>(
      () => _i845.NetworkInfoImpl(gh<_i973.InternetConnectionChecker>()),
    );
    return this;
  }
}

class _$AppModule extends _i809.AppModule {}

class _$DataResourcesModule extends _i809.DataResourcesModule {}
