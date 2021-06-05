import 'package:flutter/material.dart';

class ThemeConfig {
  static Color lightPrimary = Colors.white;
  // static Color darkPrimary = Color(0xFF1D212B);
  static Color lightAccent = const Color(0xffd82f25);
  static Color darkAccent = const Color(0xffe3a6a1);
  // static Color lightBG = Colors.white;
  // static Color darkBG = Color(0xFF111820);
  static Color lightContrast = const Color(0xfffce8e7);
  static Color darkContrast = const Color(0xff523a3a);

  static ThemeData lightTheme = ThemeData(
    primaryColorLight: lightContrast,
    textTheme: Typography.blackMountainView,
    // backgroundColor: lightBG,
    primaryColor: lightPrimary,
    accentColor: lightAccent,
    brightness: Brightness.light,
    // scaffoldBackgroundColor: lightBG,
    appBarTheme: AppBarTheme(
      elevation: 0.0,
    ),
  );

  static ThemeData darkTheme = ThemeData(
    primaryColorLight: darkContrast,
    textTheme: Typography.whiteMountainView,
    brightness: Brightness.dark,
    // backgroundColor: darkBG,
    // primaryColor: darkPrimary,
    accentColor: darkAccent,
    // scaffoldBackgroundColor: darkBG,
    // cursorColor: darkAccent, textselectiontheme.cursorcolor
    appBarTheme: AppBarTheme(
      elevation: 0.0,
    ),
  );
}
