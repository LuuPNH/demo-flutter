part of 'product_detail_bloc.dart';

@immutable
class ProductDetailState {
  final dynamic error;
  final bool isLoading;
  final Product product;

  const ProductDetailState({
    this.error,
    this.isLoading = true,
    required this.product,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ProductDetailState &&
          runtimeType == other.runtimeType &&
          error == other.error &&
          isLoading == other.isLoading &&
          product == other.product;

  @override
  int get hashCode => error.hashCode ^ isLoading.hashCode ^ product.hashCode;

  ProductDetailState copyWith({
    dynamic error,
    bool? isLoading,
    Product? product,
  }) {
    return ProductDetailState(
      error: error,
      isLoading: isLoading ?? false,
      product: product ?? this.product,
    );
  }
}
