import 'package:flutter/material.dart';
import 'package:knovator/config/theme/app_colors.dart';

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
      titleLarge: TextStyle(
        color: AppColors.black,
        fontSize: 20,
        fontWeight: FontWeight.w700,
      ),
      titleMedium: TextStyle(
        color: AppColors.black,
        fontSize: 16,
        fontWeight: FontWeight.w600,
      ),
      titleSmall: TextStyle(
        color: AppColors.black,
        fontSize: 14,
        fontWeight: FontWeight.w400,
      ),
    ),
  );
}
