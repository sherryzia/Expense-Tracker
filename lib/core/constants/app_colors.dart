import 'package:flutter/material.dart';

/// Central color palette.
///
/// Widgets must reference [AppColors] or derive colors from
/// `Theme.of(context)`; raw hex values are never declared inline.
abstract final class AppColors {
  // Brand
  static const Color primary = Color(0xFF00D09E); // Main Green
  static const Color darkGreen = Color(0xFF0E3E3E); // Dark Mode Green bar
  static const Color primaryTint = Color(0xFFDFF7E2);
  static const Color inkGreen = Color(0xFF093030); // Letters and Icons
  static const Color subtext = Color(0xFF4B4544);

  static const Color secondary = Color(0xFF6C77FF);

  static const Color success = Color(0xFF2ECC71);
  static const Color warning = Color(0xFFF39C12);
  static const Color error = Color(0xFFE74C3C);

  static const Color background = Color(0xFFF6F8FB);
  static const Color backgroundMint = Color(0xFFF1FFF3);
  static const Color surface = Color(0xFFFFFFFF);
  static const Color border = Color(0xFFE5E7EB);
  static const Color inputFill = Color(0xFFE8F8F4);
  static const Color link = Color(0xFF1E90FF);
  static const Color shadow = Color(0x14093A31);

  static const Color white = Color(0xFFFFFFFF);
  static const Color textPrimary = Color(0xFF1F2937);
  static const Color textSecondary = Color(0xFF6B7280);

  static const Color income = Color(0xFF2ECC71);
  static const Color expense = Color(0xFFE74C3C);
}