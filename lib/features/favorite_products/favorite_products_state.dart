part of 'favorite_products_bloc.dart';

@immutable
class FavoriteProductsState {
  final dynamic error;
  final bool isLoading;
  final List<Product> listProducts;

  const FavoriteProductsState({
    this.error,
    this.isLoading = false,
    this.listProducts = const [],
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is FavoriteProductsState &&
          runtimeType == other.runtimeType &&
          error == other.error &&
          isLoading == other.isLoading &&
          listProducts == other.listProducts);

  @override
  int get hashCode => error.hashCode ^ isLoading.hashCode ^ listProducts.hashCode;

  FavoriteProductsState copyWith({
    dynamic error,
    bool? isLoading,
    List<Product>? listProducts,
  }) {
    return FavoriteProductsState(
      error: error,
      isLoading: isLoading ?? false,
      listProducts: listProducts ?? this.listProducts,
    );
  }
}
