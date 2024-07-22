part of 'main_bloc.dart';

@immutable
class MainState {
  final bool isFirstLoad;
  final bool isLoadingSearch;
  final bool isLoadingLoadMore;
  final bool isLoadingRefresh;
  final String searchKeyword;
  final dynamic error;
  final BaseListModel<Product>? products;

  const MainState({
    this.isFirstLoad = true,
    this.isLoadingSearch = false,
    this.isLoadingLoadMore = false,
    this.isLoadingRefresh = false,
    this.searchKeyword = '',
    this.error,
    this.products = const BaseListModel.init(),
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MainState &&
          runtimeType == other.runtimeType &&
          isFirstLoad == other.isFirstLoad &&
          isLoadingSearch == other.isLoadingSearch &&
          isLoadingLoadMore == other.isLoadingLoadMore &&
          isLoadingRefresh == other.isLoadingRefresh &&
          searchKeyword == other.searchKeyword &&
          error == other.error &&
          products == other.products;

  @override
  int get hashCode =>
      isFirstLoad.hashCode ^
      isLoadingSearch.hashCode ^
      isLoadingLoadMore.hashCode ^
      isLoadingRefresh.hashCode ^
      error.hashCode ^
      searchKeyword.hashCode ^
      products.hashCode;

  MainState copyWith({
    bool? isFirstLoad,
    bool? isLoadingSearch,
    bool? isLoadingLoadMore,
    bool? isLoadingRefresh,
    String? searchKeyword,
    dynamic error,
    BaseListModel<Product>? products,
  }) {
    return MainState(
      isFirstLoad: isFirstLoad ?? false,
      isLoadingSearch: isLoadingSearch ?? false,
      isLoadingLoadMore: isLoadingLoadMore ?? false,
      isLoadingRefresh: isLoadingRefresh ?? false,
      searchKeyword: searchKeyword ?? this.searchKeyword,
      error: error,
      products: products ?? this.products,
    );
  }
}
