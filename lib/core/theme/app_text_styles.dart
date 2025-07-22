import 'package:flutter/material.dart';
import 'package:nabd/config/responsive/responsive.dart';
import 'package:nabd/core/utils/font_utils.dart';

class AppTextStyles {
  // Headline Styles
  static TextStyle headline1(BuildContext context) => TextStyle(
        fontSize: Responsive(context).sp(7),
        fontWeight: FontWeight.w800,
        fontFamily: FontUtils.getFontFamily(context),
        color: Theme.of(context).textTheme.headlineLarge?.color,
      );

  static TextStyle headline2(BuildContext context) => TextStyle(
        fontSize: Responsive(context).sp(6),
        fontWeight: FontWeight.bold,
        fontFamily: FontUtils.getFontFamily(context),
        color: Theme.of(context).textTheme.headlineMedium?.color,
      );

  static TextStyle headline3(BuildContext context) => TextStyle(
        fontSize: Responsive(context).sp(5),
        fontWeight: FontWeight.w600,
        fontFamily: FontUtils.getFontFamily(context),
        color: Theme.of(context).textTheme.headlineSmall?.color,
      );

  // Body Styles
  static TextStyle bodyLarge(BuildContext context) => TextStyle(
        fontSize: Responsive(context).sp(4.5),
        fontWeight: FontWeight.w500,
        fontFamily: FontUtils.getFontFamily(context),
        color: Theme.of(context).textTheme.bodyLarge?.color,
      );

  static TextStyle bodyMedium(BuildContext context) => TextStyle(
        fontSize: Responsive(context).sp(4),
        fontWeight: FontWeight.normal,
        fontFamily: FontUtils.getFontFamily(context),
        color: Theme.of(context).textTheme.bodyMedium?.color,
      );

  static TextStyle caption(BuildContext context) => TextStyle(
        fontSize: Responsive(context).sp(3.5),
        fontWeight: FontWeight.w300,
        fontFamily: FontUtils.getFontFamily(context),
        color: Theme.of(context).textTheme.bodySmall?.color,
      );
}
