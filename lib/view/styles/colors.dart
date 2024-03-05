import 'package:flutter/material.dart';
import 'package:titans_crypto/logic/common/color_utils.dart';

class AppColors {
  final Color green = const Color(0xFF5ED5A8);
  final Color white = Colors.white;
  final Color black = const Color(0xFF1E1B18);
  final Color amber = const Color(0xFFFFC107);

  final bool isDark = false;

  Color shift(Color c, double d) =>
      ColorUtils.shiftHsl(c, d * (isDark ? -1 : 1));

  ThemeData toThemeData() {
    TextTheme txtTheme =
        (isDark ? ThemeData.dark() : ThemeData.light()).textTheme;
    Color txtColor = white;
    ColorScheme colorScheme = ColorScheme(
        brightness: isDark ? Brightness.dark : Brightness.light,
        primary: green,
        primaryContainer: green,
        secondary: green,
        secondaryContainer: green,
        background: black,
        surface: black,
        onBackground: txtColor,
        onSurface: txtColor,
        onError: Colors.white,
        onPrimary: Colors.white,
        onSecondary: Colors.white,
        error: Colors.red.shade400);

    var t =
        ThemeData.from(textTheme: txtTheme, colorScheme: colorScheme).copyWith(
      textSelectionTheme: TextSelectionThemeData(cursorColor: green),
      hintColor: green,
    );

    return t;
  }
}
