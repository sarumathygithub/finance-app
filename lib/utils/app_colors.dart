import 'package:flutter/material.dart';

/// Modern fintech color palette for the Finance App.
class AppColors {
  AppColors._();

  static const Color primary = Color(0xFF6C63FF);
  static const Color secondary = Color(0xFF8B5CF6);
  static const Color accent = Color(0xFF00D09E);
  static const Color background = Color(0xFF0F172A);
  static const Color card = Color(0xFF1E293B);
  static const Color white = Color(0xFFFFFFFF);
  static const Color textSecondary = Color(0xFF94A3B8);
  static const Color error = Color(0xFFEF4444);

  static const Color glassBorder = Color(0x33FFFFFF);
  static const Color glassFill = Color(0x1AFFFFFF);

  static const LinearGradient primaryGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [primary, secondary],
  );

  static const LinearGradient headerCardGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Color(0xFF6C63FF),
      Color(0xFF8B5CF6),
      Color(0xFF5B21B6),
    ],
  );

  static const LinearGradient fabGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [primary, accent],
  );
}
