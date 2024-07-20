import '../models/base_list_model.dart';
import '../models/product.dart';

abstract class DummyRepository {
  Future<BaseListModel<Product>> getAllProducts({int skip, int limit});
}
