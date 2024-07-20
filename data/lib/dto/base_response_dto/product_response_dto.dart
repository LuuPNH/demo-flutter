import 'package:data/dto/product_dto/product_dto.dart';
import 'package:domain/domain.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_response_dto.freezed.dart';
part 'product_response_dto.g.dart';

@freezed
class ProductsResponseDto with _$ProductsResponseDto {
  const factory ProductsResponseDto({
    List<ProductDto>? products,
    int? total,
    int? skip,
    int? limit,
  }) = _ProductsResponseDto;

  factory ProductsResponseDto.fromJson(Map<String, dynamic> json) =>
      _$ProductsResponseDtoFromJson(json);
}

extension ProductsResponseDtoExtension on ProductsResponseDto {
  /// Converts a BaseListModel of ProductDto items to a BaseListModel of Product domain models.
  BaseListModel<Product> get toDomain => BaseListModel(
        items: products?.map((e) => e.toDomain).toList() ?? [],
        limit: limit,
        total: total,
        skip: skip,
      );
}
