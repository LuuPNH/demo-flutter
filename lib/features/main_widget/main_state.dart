part of 'main_bloc.dart';

@immutable
class MainState {
  final bool isFirstLoad;
  final bool isLoading;
  final dynamic error;
  final BaseListModel<Product>? products;

  const MainState({
    this.isFirstLoad = true,
    this.isLoading = false,
    this.error,
    this.products = const BaseListModel.init(),
  });

  MainState copyWith({
    bool? isFirstLoad,
    bool? isLoading,
    dynamic error,
    BaseListModel<Product>? products,
  }) {
    return MainState(
      isFirstLoad: isFirstLoad ?? false,
      isLoading: isLoading ?? false,
      error: error,
      products: products ?? this.products,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MainState &&
          runtimeType == other.runtimeType &&
          isFirstLoad == other.isFirstLoad &&
          isLoading == other.isLoading &&
          error == other.error &&
          products == other.products;

  @override
  int get hashCode =>
      isFirstLoad.hashCode ^ isLoading.hashCode ^ error.hashCode ^ products.hashCode;
}
