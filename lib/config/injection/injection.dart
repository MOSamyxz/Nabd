import 'package:get_it/get_it.dart';
import 'package:nabd/core/cubits/network/network_cubit.dart';
import 'package:nabd/core/services/app_service.dart';
import 'package:nabd/core/services/auth_service.dart';
import 'package:nabd/core/services/crud_service.dart';
import 'package:nabd/core/services/network_service.dart';
import 'package:nabd/core/services/image_picker_service.dart';
import 'package:nabd/core/services/shared_prefrences_service.dart';
import 'package:nabd/core/services/theme_service.dart';
import 'package:nabd/features/auth/data/datasources/auth_local_data_source.dart';
import 'package:nabd/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:nabd/features/auth/data/repositories/auth_repository.dart';
import 'package:nabd/features/auth/presentation/log_in/login_cubit.dart/login_cubit.dart';
import 'package:nabd/features/auth/presentation/sign_up/cubit/sign_up_cubit.dart';

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

  //* Auth Service
  sl.registerLazySingleton(() => AuthService());
  sl.registerLazySingleton(() => SupabaseCrudService());

  //* Shared Preferences Service
  sl.registerLazySingleton(() => SharedPrefrencesService());

  //* Theme Service
  sl.registerLazySingleton<ThemeService>(() => ThemeServiceImpl(sl()));

  //* Image Picker Service
  sl.registerLazySingleton(() => ImagePickerService());

  //* Network Service
  sl.registerLazySingleton(() => NetworkService());
  sl.registerFactory(() => NetworkCubit(sl<NetworkService>()));

  //* Auth Feature
  //? Remote Data Source
  sl.registerLazySingleton<AuthRemoteDataSource>(
    () => AuthRemoteDataSourceImpl(sl(), sl()),
  );
  //? Local Data Source
  sl.registerLazySingleton<UserLocalStorage>(() => UserLocalStorage());
  sl.registerLazySingleton<AuthRepository>(
    () => AuthRepository(remoteDataSource: sl(), localStorage: sl()),
  );
  sl.registerFactory<LoginCubit>(() => LoginCubit(sl(), sl(), sl()));
  sl.registerFactory<SignUpCubit>(() => SignUpCubit(sl(), sl(), sl()));
}