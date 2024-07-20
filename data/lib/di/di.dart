import 'dart:async';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'di.config.dart';

@InjectableInit(
  initializerName: 'initDIData', // default
  preferRelativeImports: true, // default
  asExtension: true, // default
)
Future<void> configureDependenciesData(GetIt getIt, String env) async {
  getIt.initDIData(environment: env);
  await getIt.allReady(timeout: const Duration(seconds: 5));
}

@module
abstract class RegisterModule {
  @lazySingleton
  Future<SharedPreferences> get sharedPreferences => SharedPreferences.getInstance();

  @lazySingleton
  Dio dio() {
    BaseOptions options = BaseOptions(
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
    );

    Dio dio = Dio(options);
    return dio;
  }
}
