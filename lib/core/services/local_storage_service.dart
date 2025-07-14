import 'package:hive/hive.dart';

class LocalStorageService {
  static late Box _box;

  static Future<void> init() async {
    _box = await Hive.openBox('appBox');
  }

  T? get<T>(String key) => _box.get(key);
  Future<void> set<T>(String key, T value) async => _box.put(key, value);
  Future<void> delete(String key) async => _box.delete(key);
}
