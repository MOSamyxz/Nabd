import 'dart:developer';

import 'package:hive/hive.dart';

class LocalStorageService {
  static final LocalStorageService _instance = LocalStorageService._internal();
  factory LocalStorageService() => _instance;
  LocalStorageService._internal();

  late Box _box;

  Future<void> init() async {
    _box = await Hive.openBox('appBox');
  }

  T? get<T>(String key) {
    try {
      return _box.get(key) as T?;
    } catch (e) {
      log('LocalStorageService.get error: $e');
      return null;
    }
  }

  Future<void> set<T>(String key, T value) async {
    try {
      await _box.put(key, value);
    } catch (e) {
      log('LocalStorageService.set error: $e');
    }
  }

  Future<void> delete(String key) async {
    try {
      await _box.delete(key);
    } catch (e) {
      log('LocalStorageService.delete error: $e');
    }
  }

  Future<void> clear() async {
    try {
      await _box.clear();
    } catch (e) {
      log('LocalStorageService.clear error: $e');
    }
  }
}
