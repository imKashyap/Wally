import 'package:flutter/material.dart';

class ThemeConfig {
  static Color lightPrimary = Colors.white;
  static Color darkPrimary = Color(0xFF1D212B);
  static Color lightAccent = Colors.teal.shade900;
  static Color darkAccent = Colors.teal;
  static Color lightBG = Colors.white;
  static Color darkBG = Color(0xFF111820);
  static Color lightContrast = Colors.grey.shade100;
  static Color darkContrast = Color(0xFF1D212B);

  static ThemeData lightTheme = ThemeData(
    cardColor: lightContrast,
    textTheme: Typography.blackMountainView,
    backgroundColor: lightBG,
    primaryColor: lightPrimary,
    accentColor: lightAccent,
    brightness: Brightness.light,
    scaffoldBackgroundColor: lightBG,
    appBarTheme: AppBarTheme(
      elevation: 0.0,
    ),
  );

  static ThemeData darkTheme = ThemeData(
    cardColor: darkContrast,
    textTheme: Typography.whiteMountainView,
    brightness: Brightness.dark,
    backgroundColor: darkBG,
    primaryColor: darkPrimary,
    accentColor: darkAccent,
    scaffoldBackgroundColor: darkBG,
    // cursorColor: darkAccent, textselectiontheme.cursorcolor
    appBarTheme: AppBarTheme(
      elevation: 0.0,
    ),
  );
}
