import 'package:get_it/get_it.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:nabd/features/auth/data/datasources/auth_remote_datasource.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'features/auth/data/repositories/auth_repository_impl.dart';
import 'features/auth/domain/repositories/auth_repository.dart';
import 'features/auth/domain/usecases/login_user.dart';
import 'features/auth/domain/usecases/register_user.dart';
import 'features/auth/presentation/cubit/auth_cubit.dart';

final getIt = GetIt.instance;

Future<void> init() async {
  // 🔥 Firebase Instances
  getIt.registerLazySingleton(() => FirebaseAuth.instance);
  getIt.registerLazySingleton(() => FirebaseFirestore.instance);
  // 📦 Remote DataSource
  getIt.registerLazySingleton(
    () => Supabase.instance.client, 
  );

  // 📦 Auth Repository
  getIt.registerLazySingleton<AuthRemoteDatasource>(
  () => AuthRemoteDatasourceImpl(getIt()),
);
  getIt.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(getIt()),
  );

  // 💡 UseCases
  getIt.registerLazySingleton(() => RegisterUser(getIt()));
  getIt.registerLazySingleton(() => LoginUser(getIt()));

  // 🧠 Auth Cubit
  getIt.registerFactory(() => AuthCubit(
        registerUser: getIt(),
        loginUser: getIt(),
      ));
}
