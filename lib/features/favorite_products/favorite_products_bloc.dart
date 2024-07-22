import 'dart:async';

import 'package:burningbros/base/base_bloc/base_bloc.dart';
import 'package:burningbros/base/base_bloc/base_event.dart';
import 'package:domain/domain.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

part 'favorite_products_event.dart';

part 'favorite_products_state.dart';

@injectable
class FavoriteProductsBloc extends BaseBloc<FavoriteProductsState> {
  final LocalDataRepository localDataRepository;

  FavoriteProductsBloc(this.localDataRepository)
      : super(FavoriteProductsState(listProducts: localDataRepository.listFavoriteProducts ?? [])) {
    on<UpdateListFavoriteProductsEvent>(_onAddUpdateListFavoriteProductsEvent);
  }

  @override
  void onAddErrorEvent(ErrorEvent event, Emitter<FavoriteProductsState> emit) {
    emit(state.copyWith(error: event.error));
  }

  Future<void> _onAddUpdateListFavoriteProductsEvent(
      UpdateListFavoriteProductsEvent event, Emitter<FavoriteProductsState> emit) async {
    emit(state.copyWith(listProducts: localDataRepository.listFavoriteProducts));
  }
}
