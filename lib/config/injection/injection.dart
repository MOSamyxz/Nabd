import 'package:get_it/get_it.dart';
import 'package:nabd/core/services/app_service.dart';
import 'package:nabd/core/services/image_picke_service.dart';
import 'package:nabd/core/services/local_storage_service.dart';
import 'package:nabd/core/services/network_service.dart';
import 'package:nabd/core/services/shared_prefrences_service.dart';
import 'package:nabd/core/services/theme_service.dart';

final sl = GetIt.instance;

Future<void> initServiceLocator() async {
  //* App
  sl.registerLazySingleton(
    () => AppService(
      localStorage: sl(),
      networkService: sl(),
      themeService: sl(),
    ),
  );

  //* Local Storage Service
  final localStorage = LocalStorageService();
  await localStorage.init();
  sl.registerSingleton<LocalStorageService>(localStorage);

  //* Shared Preferences Service
  sl.registerLazySingleton(() => SharedPrefrencesService());

  //* Network Service
  sl.registerLazySingleton(() => NetworkService());

//* Theme Service
  sl.registerLazySingleton<ThemeService>(() => ThemeServiceImpl(sl()));
  //* Image Picker Service
  sl.registerLazySingleton(() => ImagePickerService());
}
