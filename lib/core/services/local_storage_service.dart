import 'package:hive/hive.dart';

abstract class LocalStorageService<T> {
  final String boxName;

  LocalStorageService(this.boxName);

  Future<void> openBox() async {
    if (!Hive.isBoxOpen(boxName)) {
      await Hive.openBox<T>(boxName);
    }
  }

  Future<void> save(String key, T value) async {
    final box = Hive.box<T>(boxName);
    await box.put(key, value);
  }

  T? get(String key) {
    final box = Hive.box<T>(boxName);
    return box.get(key);
  }

  Future<void> delete(String key) async {
    final box = Hive.box<T>(boxName);
    await box.delete(key);
  }

  Future<void> clear() async {
    final box = Hive.box<T>(boxName);
    await box.clear();
  }
}
