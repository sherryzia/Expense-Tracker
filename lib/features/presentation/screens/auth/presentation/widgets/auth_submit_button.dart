import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../../core/constants/app_colors.dart';

/// Visual variant of an auth submit button.
enum AuthSubmitVariant { primary, quiet }

/// Full-width pill button used for the main auth actions.
class AuthSubmitButton extends StatelessWidget {
  const AuthSubmitButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.variant = AuthSubmitVariant.primary,
  });

  final String label;
  final VoidCallback onPressed;
  final AuthSubmitVariant variant;

  @override
  Widget build(BuildContext context) {
    final bool isPrimary = variant == AuthSubmitVariant.primary;

    return SizedBox(
      width: double.infinity,
      height: 56,
      child: FilledButton(
        onPressed: onPressed,
        style: FilledButton.styleFrom(
          backgroundColor: isPrimary ? AppColors.primary : AppColors.inputFill,
          foregroundColor: isPrimary ? AppColors.white : AppColors.darkGreen,
          elevation: 0,
          shape: const StadiumBorder(),
          textStyle: GoogleFonts.poppins(
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        child: Text(label),
      ),
    );
  }
}