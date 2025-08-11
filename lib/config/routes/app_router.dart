import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:nabd/config/injection/injection.dart';
import 'package:nabd/features/auth/presentation/log_in/login_cubit.dart/login_cubit.dart';
import 'package:nabd/features/auth/presentation/log_in/pages/login_page.dart';
import 'package:nabd/features/auth/presentation/sign_up/cubit/sign_up_cubit.dart';
import 'package:nabd/features/auth/presentation/sign_up/pages/sign_up_page.dart';
import 'app_routes.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: AppRoutes.login,
  routes: [
    /*   GoRoute(
      path: AppRoutes.authGate,
      builder: (context, state) => const HomePage(),
    ), */
    GoRoute(
      path: AppRoutes.login,
      builder:
          (context, state) => BlocProvider(
            create: (context) => sl<LoginCubit>(),
            child: const LoginPage(),
          ),
    ),
    GoRoute(
      path: AppRoutes.signUp,
      builder:
          (context, state) => BlocProvider(
            create: (context) => sl<SignUpCubit>(),
            child: const SignUpPage(),
          ),
    ),
  ],
  errorBuilder:
      (context, state) =>
          const Scaffold(body: Center(child: Text('404 – Page not found'))),
);

CustomTransitionPage buildFadeTransition(Widget child) {
  return CustomTransitionPage(
    child: child,
    transitionsBuilder:
        (context, animation, secondaryAnimation, child) =>
            FadeTransition(opacity: animation, child: child),
  );
}
