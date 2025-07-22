 
import 'package:flutter/material.dart';
import 'package:nabd/core/theme/app_fonts.dart';
 
class FontUtils {
  static String getFontFamily(BuildContext context) {
    final locale = Localizations.localeOf(context);
    final langCode = locale.languageCode;

    if (langCode == 'ar') {
      return AppFonts.arabic;
    } else {
      return AppFonts.english;
    }
  }
}
