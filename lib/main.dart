import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hive/hive.dart';
import 'package:nabd/core/cubits/theme/theme_cubit.dart';
import 'package:nabd/core/cubits/network/network_cubit.dart';
import 'package:nabd/features/auth/data/models/user_model.dart';
import 'package:path_provider/path_provider.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'package:nabd/config/injection/injection.dart';
import 'package:nabd/nabd_app.dart';

import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  await dotenv.load(fileName: ".env");

  await Supabase.initialize(
    url: dotenv.env['SUPABASE_URL']!,
    anonKey: dotenv.env['SUPABASE_ANON_KEY']!,
  );
  final appDocumentDir = await getApplicationDocumentsDirectory();
  Hive.init(appDocumentDir.path);
  await Hive.openBox<UserModel>('userBox');

  await initServiceLocator();

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => sl<NetworkCubit>()),
        BlocProvider(create: (_) => ThemeCubit()),
      ],
      child: NabdApp(),
    ),
  );
}
