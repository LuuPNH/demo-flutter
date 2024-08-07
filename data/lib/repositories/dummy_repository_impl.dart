import 'package:data/network/dio_request.dart';
import 'package:domain/domain.dart';
import 'package:injectable/injectable.dart';

import '../dto/base_response_dto/product_response_dto.dart';

///Path
const _pathProducts = '/products/search';

@Singleton(as: DummyRepository)
class DummyRepositoryImpl implements DummyRepository {
  final DioRequest dioRequest;

  const DummyRepositoryImpl(
    this.dioRequest,
  );

  GET get _getAllProductsMethod => GET(_pathProducts);

  @override
  Future<BaseListModel<Product>> getAllProducts(
      {int skip = 0, int limit = 20, String keyword = ''}) async {
    final res = await dioRequest.request(
      method: _getAllProductsMethod,
      queryParameters: {"limit": limit, "skip": skip, "q": keyword},
    );
    return ProductsResponseDto.fromJson(res.data).toDomain;
  }
}
