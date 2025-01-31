import 'package:algo_news/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static final ColorScheme lightColorScheme = ColorScheme.fromSeed(
    seedColor: AppColors.primaryColor,
    brightness: Brightness.light,
  );

  static final ColorScheme darkColorScheme = ColorScheme.fromSeed(
    seedColor: AppColors.primaryColor,
    brightness: Brightness.dark,
  );

  static final ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    colorScheme: lightColorScheme,
    scaffoldBackgroundColor: Color(0xFFF9FAFB),
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.white,
      foregroundColor: Colors.black,
      elevation: 2,
    ),
    cardTheme: CardTheme(
      color: Colors.white,
      elevation: 2,
      shadowColor: lightColorScheme.shadow,
    ),
    iconTheme: IconThemeData(
      color: lightColorScheme.onSurface,
    ),
    textTheme: TextTheme(
      titleLarge: TextStyle(color: lightColorScheme.onSurface),
      titleMedium: TextStyle(color: lightColorScheme.onSurface),
      bodyLarge: TextStyle(color: lightColorScheme.onSurface),
      bodyMedium: TextStyle(color: lightColorScheme.onSurface),
    ),
  );

  static final ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    colorScheme: darkColorScheme,
    appBarTheme: AppBarTheme(
      backgroundColor: darkColorScheme.background,
      foregroundColor: darkColorScheme.onBackground,
      elevation: 0,
    ),
    cardTheme: CardTheme(
      color: darkColorScheme.surface,
      elevation: 2,
      shadowColor: darkColorScheme.shadow,
    ),
    iconTheme: IconThemeData(
      color: darkColorScheme.onSurface,
    ),
    textTheme: TextTheme(
      titleLarge: TextStyle(color: darkColorScheme.onSurface),
      titleMedium: TextStyle(color: darkColorScheme.onSurface),
      bodyLarge: TextStyle(color: darkColorScheme.onSurface),
      bodyMedium: TextStyle(color: darkColorScheme.onSurface),
    ),
  );
}
