import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../../core/constants/app_colors.dart';

/// Circular, outlined social icon button (e.g. "f" / "G").
class SocialCircle extends StatelessWidget {
  const SocialCircle({
    super.key,
    required this.label,
    this.onPressed,
  });

  final String label;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed,
      style: OutlinedButton.styleFrom(
        shape: const CircleBorder(),
        side: const BorderSide(color: AppColors.border, width: 1.5),
        minimumSize: const Size(52, 52),
        padding: EdgeInsets.zero,
      ),
      child: Text(
        label,
        style: GoogleFonts.poppins(
          color: AppColors.textPrimary,
          fontSize: 20,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}