import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:nabd/config/routes/app_router.dart';
import 'package:nabd/core/cubits/locale/locale_cubit.dart';
import 'package:nabd/core/cubits/theme/theme_cubit.dart';
import 'package:nabd/core/theme/app_theme.dart';

import 'package:nabd/generated/l10n.dart';

class NabdApp extends StatelessWidget {
  const NabdApp({super.key});
  @override
  Widget build(BuildContext context) {
        final theme = context.watch<ThemeCubit>().state;
    final locale = context.watch<LocaleCubit>().state;

    return MaterialApp.router(
      title: 'Nabd',
      themeMode: theme,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      locale: locale,
      localizationsDelegates: [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      debugShowCheckedModeBanner: false,
      routerConfig: appRouter,
    );
  }
}
