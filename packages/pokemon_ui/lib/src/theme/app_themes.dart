import 'package:flutter/material.dart';
import 'package:pokemon_ui/src/theme/app_colors.dart';
import 'package:pokemon_ui/src/theme/app_styles.dart';

class AppThemes {
  AppThemes._();

  static final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: AppColors.primary,
    colorScheme: AppColors.colorScheme,
    textTheme: AppStyles.textTheme,
  );

  static final ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: AppColors.grayDarker,
  );
}
