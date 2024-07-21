import 'package:domain/domain.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_dto.g.dart';

part 'product_dto.freezed.dart';

@freezed
class ProductDto with _$ProductDto {
  const factory ProductDto({
    required int id,
    String? title,
    String? description,
    String? category,
    double? price,
    double? discountPercentage,
    double? rating,
    int? stock,
    List<String>? tags,
    String? brand,
    String? sku,
    double? weight,
    String? warrantyInformation,
    String? shippingInformation,
    String? availabilityStatus,
    String? returnPolicy,
    int? minimumOrderQuantity,
    List<String>? images,
    String? thumbnail,
  }) = _ProductDto;

  factory ProductDto.fromJson(Map<String, dynamic> json) => _$ProductDtoFromJson(json);

  factory ProductDto.fromDomain(Product pro) => ProductDto(
        id: pro.id,
        title: pro.title,
        description: pro.description,
        discountPercentage: pro.discountPercentage,
        price: pro.price,
        thumbnail: pro.thumbnail,
      );
}

extension ProductDtoExtension on ProductDto {
  /// Converts ProductDto to a domain model Product.
  Product get toDomain => Product(
        id: id,
        title: title ?? '',
        description: description ?? '',
        discountPercentage: discountPercentage ?? 0.0,
        price: price ?? 0.0,
        thumbnail: thumbnail ?? '',
      );
}
