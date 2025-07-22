import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nabd/features/chat/signup_page.dart';
import 'app_routes.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: AppRoutes.authGate,
  routes: [
    GoRoute(
      path: AppRoutes.authGate,
      builder: (context, state) => const SignUpPage(),
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
 