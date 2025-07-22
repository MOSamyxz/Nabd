
import 'package:flutter/material.dart';
import 'package:nabd/core/services/shared_prefrences_service.dart';

abstract class ThemeService {
  Future<void> loadTheme();
  ThemeMode get themeMode;
  Future<void> toggleTheme();
}


class ThemeServiceImpl implements ThemeService {
  final SharedPrefrencesService  sharedPrefrencesService;

  static const _themeKey = 'isDarkMode';
  ThemeMode _themeMode = ThemeMode.system;

  ThemeServiceImpl(this.sharedPrefrencesService);

  @override
  Future<void> loadTheme() async {
    final isDark = await sharedPrefrencesService.getBool(_themeKey);
    _themeMode = isDark == null
        ? ThemeMode.system
        : (isDark ? ThemeMode.dark : ThemeMode.light);
  }

  @override
  ThemeMode get themeMode => _themeMode;

  @override
  Future<void> toggleTheme() async {
    if (_themeMode == ThemeMode.dark) {
      _themeMode = ThemeMode.light;
      await sharedPrefrencesService.setBool(_themeKey, false);
    } else {
      _themeMode = ThemeMode.dark;
      await sharedPrefrencesService.setBool(_themeKey, true);
    }
  }
}
