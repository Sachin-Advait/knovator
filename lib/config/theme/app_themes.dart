import 'app_colors.dart';
import 'package:flutter/material.dart';

class AppThemes {
  static final ThemeData appTheme = ThemeData(
    fontFamily: "Montserrat",
    brightness: Brightness.light,
    scaffoldBackgroundColor: AppColors.background,
    appBarTheme: const AppBarTheme(
      surfaceTintColor: Colors.transparent,
    ),
    iconTheme: const IconThemeData(color: Colors.white),
    dialogTheme: const DialogTheme(
      backgroundColor: Colors.white,
      surfaceTintColor: Colors.white,
    ),
    textTheme: const TextTheme(
      headlineMedium: TextStyle(
        color: AppColors.black,
        fontSize: 20,
      ),
      headlineSmall: TextStyle(
        color: AppColors.black,
        fontSize: 18,
      ),
      titleLarge: TextStyle(
        color: AppColors.black,
        fontSize: 16,
      ),
      titleMedium: TextStyle(
        color: AppColors.black,
        fontSize: 14,
      ),
      titleSmall: TextStyle(
        color: AppColors.black,
        fontSize: 12,
      ),
    ),
  );
}
