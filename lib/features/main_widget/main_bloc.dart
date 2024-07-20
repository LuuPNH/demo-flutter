import 'dart:async';
import 'package:domain/domain.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../base/base_bloc/base_bloc.dart';
import '../../base/base_bloc/base_event.dart';

part 'main_event.dart';

part 'main_state.dart';

@lazySingleton
class MainBloc extends BaseBloc<MainState> {
  final DummyRepository dummyRepository;

  MainBloc(
    this.dummyRepository,
  ) : super(const MainState()) {
    on<LoadMoreProductsEvent>(_onAddLoadMoreProductsEvent);
  }

  @override
  void onAddInitialEvent(InitialEvent event, Emitter<MainState> emit) async {
    await Future.delayed(const Duration(seconds: 1)); //Fake delay to smooth application
    final result = await dummyRepository.getAllProducts();
    emit(state.copyWith(products: result));
  }

  @override
  void onAddErrorEvent(ErrorEvent event, Emitter<MainState> emit) {
    emit(state.copyWith(error: event.error));
  }

  Future<void> _onAddLoadMoreProductsEvent(
      LoadMoreProductsEvent event, Emitter<MainState> emit) async {
    if (state.products?.nextItems == null) return;
    emit(state.copyWith(isLoadingLoadMore: true));
    final result = await dummyRepository.getAllProducts(skip: state.products!.nextItems!);
    emit(state.copyWith(
        products: result.copyWith(items: [...state.products?.items ?? [], ...result.items ?? []])));
  }

  @override
  void onAddRefreshEvent(RefreshEvent event, Emitter<MainState> emit) async {
    emit(state.copyWith(isLoadingRefresh: true));
    final result = await dummyRepository.getAllProducts();
    emit(state.copyWith(products: result));
  }
}
