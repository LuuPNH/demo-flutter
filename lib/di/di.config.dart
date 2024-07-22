// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:domain/domain.dart' as _i4;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../features/favorite_products/favorite_products_bloc.dart' as _i6;
import '../features/main_bloc.dart' as _i5;
import '../features/product_detail/product_detail_bloc.dart' as _i3;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.factory<_i3.ProductDetailBloc>(() => _i3.ProductDetailBloc(
          gh<_i4.Product>(),
          gh<_i4.LocalDataRepository>(),
        ));
    gh.lazySingleton<_i5.MainBloc>(
        () => _i5.MainBloc(gh<_i4.DummyRepository>()));
    gh.factory<_i6.FavoriteProductsBloc>(
        () => _i6.FavoriteProductsBloc(gh<_i4.LocalDataRepository>()));
    return this;
  }
}
