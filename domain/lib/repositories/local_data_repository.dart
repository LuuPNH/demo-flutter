import '../models/product.dart';

abstract class LocalDataRepository {
  Future<void> clearAll();

  List<Product>? listFavoriteProducts;

  bool isFavoriteProduct(int id);

  Future<bool> favoriteProduct(Product pro);
}
