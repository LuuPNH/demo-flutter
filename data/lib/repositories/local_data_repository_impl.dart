import 'package:domain/domain.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@Singleton(as: LocalDataRepository)
class LocalDataRepositoryImpl extends LocalDataRepository {
  static const String userKey = 'example-key';

  final SharedPreferences sharedPreferences;

  LocalDataRepositoryImpl({required this.sharedPreferences});

  @override
  Future<void> clearAll() async {
    await sharedPreferences.clear();
  }
}
