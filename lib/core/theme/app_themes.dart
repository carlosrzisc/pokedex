import 'package:flutter/material.dart';
import 'package:pokedex/core/theme/app_colors.dart';
import 'package:pokedex/core/theme/app_styles.dart';

class AppThemes {
  AppThemes._();

  static final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: AppColors.primary,
    colorScheme: AppColors.colorScheme,
    textTheme: AppStyles.textTheme,
  );

  /// If some day we would need to support dark theme
  static final ThemeData darkTheme = ThemeData(brightness: Brightness.dark);
}
