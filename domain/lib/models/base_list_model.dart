import 'package:flutter/foundation.dart';

class BaseListModel<T> {
  BaseListModel({
    this.items,
    this.total,
    this.limit = 0, //default expect business
    this.skip,
  });

  const BaseListModel.init({
    this.items = const [],
    this.total = 0,
    this.limit = 20, //default expect business
    this.skip = 0,
  });

  final List<T>? items;
  final int? total;
  final int limit;
  final int? skip;

  bool get canLoadMore {
    if (total == null || items == null || items!.isEmpty) return false;
    return items!.length < total!;
  }

  int? get nextItems => canLoadMore ? (items?.length ?? 0) : null;

  BaseListModel<T> copyWith({
    List<T>? items,
    int? total,
    int? limit,
    int? skip,
  }) {
    return BaseListModel<T>(
      items: items ?? this.items,
      total: total ?? this.total,
      limit: limit ?? this.limit,
      skip: skip ?? this.skip,
    );
  }

  @override
  bool operator ==(covariant BaseListModel<T> other) {
    if (identical(this, other)) return true;

    return listEquals(other.items, items) &&
        other.total == total &&
        other.limit == limit &&
        other.skip == skip &&
        other.canLoadMore == canLoadMore;
  }

  @override
  int get hashCode {
    return items.hashCode ^ total.hashCode ^ limit.hashCode ^ skip.hashCode ^ canLoadMore.hashCode;
  }

  @override
  String toString() {
    return 'BaseListModel{items: $items, total: $total, limit: $limit, skip: $skip}';
  }
}
