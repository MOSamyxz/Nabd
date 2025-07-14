
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:nabd/core/routing/app_router.dart';
import 'package:nabd/core/routing/routes.dart';
import 'package:nabd/core/theme/app_theme.dart';
import 'package:nabd/generated/l10n.dart';

class NabdApp extends StatelessWidget {
  const NabdApp({super.key, required this.appRouter, });
  final AppRouter appRouter;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
       theme: AppTheme.getLightTheme(context),
          darkTheme: AppTheme.getDarkTheme(context),
          themeMode: ThemeMode.light,
          locale: const Locale('ar'),
               localizationsDelegates: [
                S.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: S.delegate.supportedLocales,
      debugShowCheckedModeBanner: false,
initialRoute: Routes.signUpPage,
          onGenerateRoute: appRouter.onGenerateRoute,  
            );
  }
}