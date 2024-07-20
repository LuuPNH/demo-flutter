import 'package:domain/domain.dart';
import 'package:injectable/injectable.dart';

@dev
@Singleton(as: EnvironmentConfig)
class EnvironmentDev extends EnvironmentConfig {
  @override
  String get httpEnvironment => 'dev';
}

@test
@Singleton(as: EnvironmentConfig)
class EnvironmentTest extends EnvironmentConfig {
  @override
  String get httpEnvironment => 'test';
}

@prod
@Singleton(as: EnvironmentConfig)
class EnvironmentProd extends EnvironmentConfig {
  @override
  String get httpEnvironment => 'prod';
}
