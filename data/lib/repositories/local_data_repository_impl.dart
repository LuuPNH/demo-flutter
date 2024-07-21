import 'dart:convert';

import 'package:data/dto/product_dto/product_dto.dart';
import 'package:domain/domain.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@Singleton(as: LocalDataRepository)
class LocalDataRepositoryImpl extends LocalDataRepository {
  static const String favoriteProductsKey = 'favorite-products-key';

  final SharedPreferences sharedPreferences;

  LocalDataRepositoryImpl({required this.sharedPreferences});

  @override
  Future<void> clearAll() async {
    await sharedPreferences.clear();
  }

  @override
  List<Product>? get listFavoriteProducts {
    String? result = sharedPreferences.getString(favoriteProductsKey);
    if (result == null || result.isEmpty) return [];

    return (json.decode(result) as List<dynamic>)
        .whereType<Map>()
        .map((e) => Map<String, dynamic>.from(e))
        .map<Product>((e) => ProductDto.fromJson(e).toDomain)
        .toList();
  }

  @override
  Future<bool> favoriteProduct(Product pro) async {
    final productsLocal = List<Product>.from(listFavoriteProducts ?? []);
    final indexDB = productsLocal.indexWhere((e) => e.id == pro.id);
    if (indexDB == -1) {
      productsLocal.add(pro);
    } else {
      productsLocal.removeAt(indexDB);
    }
    final encode =
        json.encode(productsLocal.map((e) => ProductDto.fromDomain(e).toJson()).toList());
    await sharedPreferences.setString(favoriteProductsKey, encode);
    return indexDB == -1;
  }

  @override
  bool isFavoriteProduct(int id) {
    final productsLocal = List<Product>.from(listFavoriteProducts ?? []);
    return productsLocal.indexWhere((e) => e.id == id) != -1;
  }
}
