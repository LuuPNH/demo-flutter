import 'package:burningbros/base/base_bloc/base_bloc.dart';
import 'package:burningbros/base/base_bloc/base_event.dart';
import 'package:domain/domain.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

part 'product_detail_event.dart';

part 'product_detail_state.dart';

@injectable
class ProductDetailBloc extends BaseBloc<ProductDetailState> {
  final LocalDataRepository localDataRepository;
  final Product product;

  ProductDetailBloc(
    this.product,
    this.localDataRepository,
  ) : super(ProductDetailState(product: product)) {
    on<FavoriteProductEvent>(_onAddFavoriteProductEvent);
  }

  @override
  void onAddErrorEvent(ErrorEvent event, Emitter<ProductDetailState> emit) {
    emit(state.copyWith(error: event.error));
  }

  @override
  void onAddInitialEvent(InitialEvent event, Emitter<ProductDetailState> emit) async {
    final isFavorite = localDataRepository.isFavoriteProduct(state.product.id);
    emit(state.copyWith(product: state.product.copyWith(isFavorite: isFavorite)));
  }

  Future<void> _onAddFavoriteProductEvent(
      FavoriteProductEvent event, Emitter<ProductDetailState> emit) async {
    emit(state.copyWith(isLoading: true));
    final isFavorite = await localDataRepository.favoriteProduct(state.product);
    emit(state.copyWith(product: state.product.copyWith(isFavorite: isFavorite)));
  }
}
