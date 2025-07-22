import 'package:flutter/material.dart';
import 'package:nabd/config/responsive/responsive.dart';

class AppSize {
  static double paddingSmall(BuildContext context) => Responsive(context).padding(2.5);
  static double paddingMedium(BuildContext context) => Responsive(context).padding(4);
  static double paddingLarge(BuildContext context) => Responsive(context).padding(6);

  static double radiusSmall(BuildContext context) => Responsive(context).radius(2.5);
  static double radiusMedium(BuildContext context) => Responsive(context).radius(4);
  static double radiusLarge(BuildContext context) => Responsive(context).radius(6);
}
