part of 'main_bloc.dart';

@immutable
class LoadMoreProductsEvent extends BaseEvent {}

@immutable
class SearchProductsEvent extends BaseEvent {
  final String keyword;

  SearchProductsEvent(this.keyword);
}
