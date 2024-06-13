import 'dart:math' as math;

import 'package:flutter/material.dart';

class Responsive {
  late double _width;
  late double _height;
  late double _diagonal;

  Responsive._(BuildContext context) {
    _width = MediaQuery.of(context).size.width;
    _height = MediaQuery.of(context).size.height;
    _diagonal = math.sqrt(math.pow(_width, 2) + math.pow(_height, 2));
  }

  factory Responsive(BuildContext context) {
    _instance ??= Responsive._(context);
    return _instance!;
  }

  static Responsive? _instance;

  double wp(double percent) => _width * percent / 100;
  double hp(double percent) => _height * percent / 100;
  double dp(double percent) => _diagonal * percent / 100;

  // Additional helper methods for specific breakpoints (same as before)
  bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < 600;
  bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width >= 600 &&
      MediaQuery.of(context).size.width < 1024;
  bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width >= 1024;
  static bool isMobileScreen(BuildContext context) =>
      Responsive(context).isMobile(context);
  static bool isTabletScreen(BuildContext context) =>
      Responsive(context).isTablet(context);
  static bool isDesktopScreen(BuildContext context) =>
      Responsive(context).isDesktop(context);
}
