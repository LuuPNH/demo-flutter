import 'package:flutter/material.dart';

import '../resources/app_colors.dart';
import '../resources/fonts.gen.dart';

class Application {
  static ThemeData themeMode() {
    final mode = WidgetsBinding.instance.platformDispatcher.platformBrightness;

    ///This is a demo project so I use it together
    switch (mode) {
      case Brightness.dark:
        return lightMode();
      case Brightness.light:
        return lightMode();
    }
  }

  static ThemeData lightMode() {
    return ThemeData(
      fontFamily: FontFamily.openSans,
      primaryColor: AppColors.white,
      primaryIconTheme: const IconThemeData(color: AppColors.black, size: 24.0),
      scaffoldBackgroundColor: AppColors.greyF4F4F4,
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.greyF4F4F4,
      ),
      cardTheme: const CardTheme(
        color: AppColors.white,
        surfaceTintColor: AppColors.white,
      ),
      textTheme: const TextTheme(
        headlineLarge: TextStyle(
          color: AppColors.black,
          fontSize: 20.0,
          fontWeight: FontWeight.bold,
        ),
        headlineMedium: TextStyle(
          color: AppColors.black,
          fontSize: 16.0,
          fontWeight: FontWeight.bold,
        ),
        headlineSmall: TextStyle(
          color: AppColors.black,
          fontSize: 12.0,
          fontWeight: FontWeight.bold,
        ),
        titleMedium: TextStyle(
          color: AppColors.black,
          fontSize: 14.0,
        ),
        titleSmall: TextStyle(
          color: AppColors.black,
          fontSize: 12.0,
        ),
        displaySmall: TextStyle(
          color: AppColors.black,
          fontSize: 11.0,
        ),
      ),
      inputDecorationTheme: const InputDecorationTheme(
        border: OutlineInputBorder(),
      ),
    );
  }
}
