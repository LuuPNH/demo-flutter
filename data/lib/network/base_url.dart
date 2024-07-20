import 'package:injectable/injectable.dart';

abstract class BaseUrl {
  String get url;
}

@dev
@Singleton(as: BaseUrl)
class BaseUrlDev implements BaseUrl {
  @override
  String get url => 'https://dummyjson.com';
}

@test
@Singleton(as: BaseUrl)
class BaseUrlTest implements BaseUrl {
  @override
  String get url => 'https://dummyjson.com';
}

@prod
@Singleton(as: BaseUrl)
class BaseUrlProd implements BaseUrl {
  @override
  String get url => 'https://dummyjson.com';
}
