import 'package:flutter/material.dart';
import 'package:merstro/lib.dart';

class MTheme{
  static final visualDensity = VisualDensity.adaptivePlatformDensity;

  static ThemeData light() => ThemeData(
    brightness: Brightness.light,
    colorScheme: const ColorScheme.light(),
    visualDensity: visualDensity,
    scaffoldBackgroundColor: MColors.white,
    primaryColor: MColors.black
  );

  static ThemeData dark() => ThemeData();
}