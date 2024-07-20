import 'dart:async';
import 'package:bloc_concurrency/bloc_concurrency.dart';
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
    on<SearchProductsEvent>(_onAddSearchProductsEvent, transformer: restartable());
  }

  @override
  void onAddInitialEvent(InitialEvent event, Emitter<MainState> emit) async {
    final result = await dummyRepository.getAllProducts();
    emit(state.copyWith(products: result));
  }

  @override
  void onAddErrorEvent(ErrorEvent event, Emitter<MainState> emit) {
    emit(state.copyWith(error: event.error));
  }

  @override
  void onAddRefreshEvent(RefreshEvent event, Emitter<MainState> emit) async {
    emit(state.copyWith(isLoadingRefresh: true));
    final result = await dummyRepository.getAllProducts(keyword: state.searchKeyword);
    emit(state.copyWith(products: result));
  }

  Future<void> _onAddLoadMoreProductsEvent(
      LoadMoreProductsEvent event, Emitter<MainState> emit) async {
    if (state.products?.nextItems == null) return;
    emit(state.copyWith(isLoadingLoadMore: true));
    final result = await dummyRepository.getAllProducts(
      skip: state.products!.nextItems!,
      keyword: state.searchKeyword,
    );
    emit(state.copyWith(
        products: result.copyWith(items: [...state.products?.items ?? [], ...result.items ?? []])));
  }

  Future<void> _onAddSearchProductsEvent(SearchProductsEvent event, Emitter<MainState> emit) async {
    emit(state.copyWith(isLoadingSearch: true));
    final result = await dummyRepository.getAllProducts(keyword: event.keyword);
    emit(state.copyWith(searchKeyword: event.keyword, products: result));
  }
}
