import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nabd/core/routing/routes.dart';
import 'package:nabd/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:nabd/features/auth/presentation/pages/signup_page.dart';
import 'package:nabd/features/home/presentation/pages/home_page.dart';
import 'package:nabd/injection_container.dart';

class AppRouter {
  Route? onGenerateRoute(RouteSettings settings) {
    //? final arguments = settings.arguments;

    switch (settings.name) {
      case Routes.homePage:
        return MaterialPageRoute(builder: (_) => const HomePage());

      case Routes.signUpPage:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<AuthCubit>(),
            child: const SignUpPage(),
          ),
        );

      default:
        return null;
    }
  }
}
