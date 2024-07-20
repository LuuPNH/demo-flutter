// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i4;
import 'package:domain/domain.dart' as _i5;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i3;

import '../network/base_url.dart' as _i7;
import '../network/dio_request.dart' as _i9;
import '../network/environment.dart' as _i6;
import '../repositories/dummy_repository_impl.dart' as _i10;
import '../repositories/local_data_repository_impl.dart' as _i8;
import 'di.dart' as _i11;

const String _test = 'test';
const String _dev = 'dev';
const String _prod = 'prod';

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt initDIData({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final registerModule = _$RegisterModule();
    gh.lazySingletonAsync<_i3.SharedPreferences>(
        () => registerModule.sharedPreferences);
    gh.lazySingleton<_i4.Dio>(() => registerModule.dio());
    gh.singleton<_i5.EnvironmentConfig>(
      () => _i6.EnvironmentTest(),
      registerFor: {_test},
    );
    gh.singleton<_i5.EnvironmentConfig>(
      () => _i6.EnvironmentDev(),
      registerFor: {_dev},
    );
    gh.singleton<_i7.BaseUrl>(
      () => _i7.BaseUrlTest(),
      registerFor: {_test},
    );
    gh.singleton<_i7.BaseUrl>(
      () => _i7.BaseUrlDev(),
      registerFor: {_dev},
    );
    gh.singletonAsync<_i5.LocalDataRepository>(() async =>
        _i8.LocalDataRepositoryImpl(
            sharedPreferences: await getAsync<_i3.SharedPreferences>()));
    gh.singleton<_i5.EnvironmentConfig>(
      () => _i6.EnvironmentProd(),
      registerFor: {_prod},
    );
    gh.lazySingletonAsync<_i9.DioRequest>(() async => _i9.DioRequest(
          gh<_i4.Dio>(),
          gh<_i5.EnvironmentConfig>(),
          gh<_i7.BaseUrl>(),
          await getAsync<_i5.LocalDataRepository>(),
        ));
    gh.singleton<_i7.BaseUrl>(
      () => _i7.BaseUrlProd(),
      registerFor: {_prod},
    );
    gh.singletonAsync<_i5.DummyRepository>(
        () async => _i10.DummyRepositoryImpl(await getAsync<_i9.DioRequest>()));
    return this;
  }
}

class _$RegisterModule extends _i11.RegisterModule {}
