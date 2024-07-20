// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product_response_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ProductsResponseDto _$ProductsResponseDtoFromJson(Map<String, dynamic> json) {
  return _ProductsResponseDto.fromJson(json);
}

/// @nodoc
mixin _$ProductsResponseDto {
  List<ProductDto>? get products => throw _privateConstructorUsedError;
  int? get total => throw _privateConstructorUsedError;
  int? get skip => throw _privateConstructorUsedError;
  int? get limit => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProductsResponseDtoCopyWith<ProductsResponseDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductsResponseDtoCopyWith<$Res> {
  factory $ProductsResponseDtoCopyWith(
          ProductsResponseDto value, $Res Function(ProductsResponseDto) then) =
      _$ProductsResponseDtoCopyWithImpl<$Res, ProductsResponseDto>;
  @useResult
  $Res call({List<ProductDto>? products, int? total, int? skip, int? limit});
}

/// @nodoc
class _$ProductsResponseDtoCopyWithImpl<$Res, $Val extends ProductsResponseDto>
    implements $ProductsResponseDtoCopyWith<$Res> {
  _$ProductsResponseDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? products = freezed,
    Object? total = freezed,
    Object? skip = freezed,
    Object? limit = freezed,
  }) {
    return _then(_value.copyWith(
      products: freezed == products
          ? _value.products
          : products // ignore: cast_nullable_to_non_nullable
              as List<ProductDto>?,
      total: freezed == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int?,
      skip: freezed == skip
          ? _value.skip
          : skip // ignore: cast_nullable_to_non_nullable
              as int?,
      limit: freezed == limit
          ? _value.limit
          : limit // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ProductsResponseDtoImplCopyWith<$Res>
    implements $ProductsResponseDtoCopyWith<$Res> {
  factory _$$ProductsResponseDtoImplCopyWith(_$ProductsResponseDtoImpl value,
          $Res Function(_$ProductsResponseDtoImpl) then) =
      __$$ProductsResponseDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<ProductDto>? products, int? total, int? skip, int? limit});
}

/// @nodoc
class __$$ProductsResponseDtoImplCopyWithImpl<$Res>
    extends _$ProductsResponseDtoCopyWithImpl<$Res, _$ProductsResponseDtoImpl>
    implements _$$ProductsResponseDtoImplCopyWith<$Res> {
  __$$ProductsResponseDtoImplCopyWithImpl(_$ProductsResponseDtoImpl _value,
      $Res Function(_$ProductsResponseDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? products = freezed,
    Object? total = freezed,
    Object? skip = freezed,
    Object? limit = freezed,
  }) {
    return _then(_$ProductsResponseDtoImpl(
      products: freezed == products
          ? _value._products
          : products // ignore: cast_nullable_to_non_nullable
              as List<ProductDto>?,
      total: freezed == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int?,
      skip: freezed == skip
          ? _value.skip
          : skip // ignore: cast_nullable_to_non_nullable
              as int?,
      limit: freezed == limit
          ? _value.limit
          : limit // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ProductsResponseDtoImpl implements _ProductsResponseDto {
  const _$ProductsResponseDtoImpl(
      {final List<ProductDto>? products, this.total, this.skip, this.limit})
      : _products = products;

  factory _$ProductsResponseDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProductsResponseDtoImplFromJson(json);

  final List<ProductDto>? _products;
  @override
  List<ProductDto>? get products {
    final value = _products;
    if (value == null) return null;
    if (_products is EqualUnmodifiableListView) return _products;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final int? total;
  @override
  final int? skip;
  @override
  final int? limit;

  @override
  String toString() {
    return 'ProductsResponseDto(products: $products, total: $total, skip: $skip, limit: $limit)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProductsResponseDtoImpl &&
            const DeepCollectionEquality().equals(other._products, _products) &&
            (identical(other.total, total) || other.total == total) &&
            (identical(other.skip, skip) || other.skip == skip) &&
            (identical(other.limit, limit) || other.limit == limit));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_products), total, skip, limit);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProductsResponseDtoImplCopyWith<_$ProductsResponseDtoImpl> get copyWith =>
      __$$ProductsResponseDtoImplCopyWithImpl<_$ProductsResponseDtoImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProductsResponseDtoImplToJson(
      this,
    );
  }
}

abstract class _ProductsResponseDto implements ProductsResponseDto {
  const factory _ProductsResponseDto(
      {final List<ProductDto>? products,
      final int? total,
      final int? skip,
      final int? limit}) = _$ProductsResponseDtoImpl;

  factory _ProductsResponseDto.fromJson(Map<String, dynamic> json) =
      _$ProductsResponseDtoImpl.fromJson;

  @override
  List<ProductDto>? get products;
  @override
  int? get total;
  @override
  int? get skip;
  @override
  int? get limit;
  @override
  @JsonKey(ignore: true)
  _$$ProductsResponseDtoImplCopyWith<_$ProductsResponseDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
