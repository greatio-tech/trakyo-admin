import 'package:flutter/material.dart';
import 'package:trakyo_admin/core/constant.dart';

class AppTheme {
  AppTheme._();
  static Color primaryColor = AppColors.primaryColor;
  static ThemeData theme = ThemeData(
    primarySwatch: MaterialColor(primaryColor.value, primarySwatch),
    brightness: Brightness.light,
    useMaterial3: true,
    fontFamily: AppConstants.fontFamily,
    scaffoldBackgroundColor: AppColors.backgroundColor,
    appBarTheme: const AppBarTheme(
      elevation: 0,
      backgroundColor: Colors.transparent,
      centerTitle: true,
    ),
  );
  static Map<int, Color> primarySwatch = {
    50: AppTheme.primaryColor.withOpacity(0.05),
    100: AppTheme.primaryColor.withOpacity(0.1),
    200: AppTheme.primaryColor.withOpacity(0.2),
    300: AppTheme.primaryColor.withOpacity(0.3),
    400: AppTheme.primaryColor.withOpacity(0.4),
    500: AppTheme.primaryColor.withOpacity(0.5),
    600: AppTheme.primaryColor.withOpacity(0.6),
    700: AppTheme.primaryColor.withOpacity(0.7),
    800: AppTheme.primaryColor.withOpacity(0.8),
    900: AppTheme.primaryColor.withOpacity(0.9),
  };
}
