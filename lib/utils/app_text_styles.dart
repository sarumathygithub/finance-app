import 'package:flutter/material.dart';

import 'app_colors.dart';

/// Centralized typography using the fintech color palette.
class AppTextStyles {
  AppTextStyles._();

  static const String _fontFamily = 'Roboto';

  static TextStyle headlineLarge = const TextStyle(
    fontFamily: _fontFamily,
    fontSize: 32,
    fontWeight: FontWeight.w700,
    color: AppColors.white,
    letterSpacing: -0.5,
  );

  static TextStyle headlineMedium = const TextStyle(
    fontFamily: _fontFamily,
    fontSize: 28,
    fontWeight: FontWeight.w700,
    color: AppColors.white,
    letterSpacing: -0.3,
  );

  static TextStyle titleLarge = const TextStyle(
    fontFamily: _fontFamily,
    fontSize: 22,
    fontWeight: FontWeight.w600,
    color: AppColors.white,
  );

  static TextStyle titleMedium = const TextStyle(
    fontFamily: _fontFamily,
    fontSize: 18,
    fontWeight: FontWeight.w600,
    color: AppColors.white,
  );

  static TextStyle bodyLarge = const TextStyle(
    fontFamily: _fontFamily,
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: AppColors.white,
  );

  static TextStyle bodyMedium = const TextStyle(
    fontFamily: _fontFamily,
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: AppColors.textSecondary,
  );

  static TextStyle bodySmall = const TextStyle(
    fontFamily: _fontFamily,
    fontSize: 12,
    fontWeight: FontWeight.w400,
    color: AppColors.textSecondary,
  );
}
