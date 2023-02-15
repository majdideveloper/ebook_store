import 'package:flutter/material.dart';

class Styles {
  static ThemeData themeData(bool isDarkTheme, BuildContext context) {
    return ThemeData(
      appBarTheme: AppBarTheme(
          centerTitle: true,
          iconTheme: const IconThemeData(
            color: Colors.blue,
          ),
          actionsIconTheme: const IconThemeData(
            color: Colors.blue,
          ),
          titleTextStyle: const TextStyle(
            color: Colors.orange,
            fontSize: 18,
            letterSpacing: 5,
          ),
          backgroundColor:
              isDarkTheme ? const Color(0xFF0a0d2c) : Colors.grey[300]),
      scaffoldBackgroundColor:
          //0A1931  // white yellow 0xFFFCF8EC
          isDarkTheme ? const Color(0xFF00001a) : const Color(0xFFFFFFFF),
      primaryColor: Colors.orange, //Color.fromRGBO(33, 150, 243, 1),
      colorScheme: ThemeData().colorScheme.copyWith(
            secondary:
                isDarkTheme ? const Color(0xFF1a1f3c) : const Color(0xFFE8FDFD),
            brightness: isDarkTheme ? Brightness.dark : Brightness.light,
          ),
      cardColor:
          isDarkTheme ? const Color(0xFF0a0d2c) : const Color(0xFFF2FDFD),
      canvasColor: isDarkTheme ? Colors.black : Colors.grey[50],
      buttonTheme: Theme.of(context).buttonTheme.copyWith(
          colorScheme: isDarkTheme
              ? const ColorScheme.dark()
              : const ColorScheme.light()),
    );
  }
}
