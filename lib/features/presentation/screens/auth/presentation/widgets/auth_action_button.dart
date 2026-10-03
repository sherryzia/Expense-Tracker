import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../../core/constants/app_colors.dart';

/// Visual variant of an auth action button.
enum AuthButtonVariant { primary, quiet }

/// Pill-shaped action button shown on the landing screen.
class AuthActionButton extends StatelessWidget {
  const AuthActionButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.variant = AuthButtonVariant.primary,
  });

  final String label;
  final VoidCallback onPressed;
  final AuthButtonVariant variant;

  @override
  Widget build(BuildContext context) {
    final bool isPrimary = variant == AuthButtonVariant.primary;

    return SizedBox(
      width: 207,
      height: 45,
      child: FilledButton(
        onPressed: onPressed,
        style: FilledButton.styleFrom(
          backgroundColor: isPrimary ? AppColors.primary : AppColors.primaryTint,
          foregroundColor: isPrimary ? AppColors.inkGreen : AppColors.darkGreen,
          padding: EdgeInsets.zero,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(22.5),
          ),
          textStyle: GoogleFonts.poppins(
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
        child: Text(label),
      ),
    );
  }
}