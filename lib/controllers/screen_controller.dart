import 'package:drklepson_utility_package/drklepson_utility_package.dart';
import 'package:flutter/material.dart';

class ScreenController {
  static double pixelRatio(BuildContext context) =>
      MediaQuery.of(context).devicePixelRatio;
  static double textScaleFactor(BuildContext context) =>
      MediaQuery.of(context).textScaleFactor;

  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < 600;

  static bool isTablet(BuildContext context) =>
      context.width < 1280 && context.width >= 600;

  static bool isDekstop(BuildContext context) => context.width >= 1280;
}
