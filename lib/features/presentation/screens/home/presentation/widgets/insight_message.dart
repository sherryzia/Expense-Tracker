import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../../core/constants/app_colors.dart';
import '../../../../../../core/constants/app_strings.dart';

/// Checklist insight line shown under the budget progress bar.
class InsightMessage extends StatelessWidget {
  const InsightMessage({super.key, this.centered = false});

  final bool centered;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment:
          centered ? MainAxisAlignment.center : MainAxisAlignment.start,
      children: <Widget>[
        const Icon(
          Icons.check_circle_rounded,
          color: AppColors.white,
          size: 16,
        ),
        const SizedBox(width: 6),
        Text(
          AppStrings.dashboardInsight,
          style: GoogleFonts.poppins(
            color: AppColors.white,
            fontSize: 12,
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }
}