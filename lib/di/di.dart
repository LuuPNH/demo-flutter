
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:data/di/di.dart' as di;

import 'di.config.dart';

final GetIt getIt = GetIt.instance;

@InjectableInit(
    initializerName: 'init',
    preferRelativeImports: true,
    asExtension: true,
    ignoreUnregisteredTypes: [
    ])
Future<void> configureInjection(String env) async {
  await di.configureDependenciesData(getIt, env);
  getIt.init(environment: env);
  await getIt.allReady(timeout: const Duration(seconds: 5));
}
