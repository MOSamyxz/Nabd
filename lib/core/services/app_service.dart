import 'package:flutter/material.dart';
import 'package:nabd/core/errors/exceptions.dart';
import 'package:nabd/core/services/theme_service.dart';
 import 'local_storage_service.dart';
import 'network_service.dart';
class AppService {
  final LocalStorageService localStorage;
  final NetworkService networkService;
  final ThemeService themeService;

  AppService({
    required this.localStorage,
    required this.networkService,
    required this.themeService,
  });

  Future<void> initApp() async {
    debugPrint('⚙️ AppService: Starting initialization...');

    await Future.wait([
      _checkNetwork(),
      themeService.loadTheme(),
    ]);

    debugPrint('✅ AppService: Initialization complete.');
  }

  Future<void> _checkNetwork() async {
    final hasInternet = await networkService.hasInternet();
    if (!hasInternet) throw NetworkException();
  }
}
