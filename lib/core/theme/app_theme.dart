import 'package:flutter/material.dart';
import 'app_colors.dart';
import 'app_text_styles.dart';

class AppTheme {
  static ThemeData getDarkTheme(BuildContext context) {
    return ThemeData(
      brightness: Brightness.dark,
      scaffoldBackgroundColor: AppColors.black,
      primaryColor: AppColors.primary,
      cardColor: AppColors.black,
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.black,
        foregroundColor: AppColors.white,
        elevation: 0,
      ),
      textTheme: AppTextStyles.getTextTheme(context),
      iconTheme: const IconThemeData(color: AppColors.white),
      colorScheme: const ColorScheme.dark(
        primary: AppColors.primary,
        secondary: AppColors.secondary,
      ),
      useMaterial3: true,
    );
  }

  static ThemeData getLightTheme(BuildContext context) {
    return ThemeData(
      brightness: Brightness.light,
      scaffoldBackgroundColor: AppColors.white,
      primaryColor: AppColors.primary,
      cardColor: AppColors.white,
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.white,
        foregroundColor: AppColors.black,
        elevation: 0,
      ),
      textTheme: AppTextStyles.getTextTheme(context),
      iconTheme: const IconThemeData(color: AppColors.black),
      colorScheme: const ColorScheme.light(
        primary: AppColors.primary,
        secondary: AppColors.secondary,
      ),
      useMaterial3: true,
    );
  }
}
