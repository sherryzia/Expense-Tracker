import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../../core/constants/app_colors.dart';
import '../../../../../../core/constants/app_strings.dart';

/// Mint-header budget row: white capsule track filled 30% with a dark
/// contrast block, and the target budget text on the far right.
class BudgetProgressBar extends StatelessWidget {
  const BudgetProgressBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          child: Container(
            height: 26,
            decoration: BoxDecoration(
              color: AppColors.white.withValues(alpha: 0.3),
              borderRadius: BorderRadius.circular(13),
            ),
            child: Stack(
              children: <Widget>[
                FractionallySizedBox(
                  widthFactor: 0.3,
                  heightFactor: 1,
                  child: Container(
                    alignment: Alignment.centerLeft,
                    padding: const EdgeInsets.only(left: 14),
                    decoration: BoxDecoration(
                      color: AppColors.darkGreen,
                      borderRadius: BorderRadius.circular(13),
                    ),
                    child: Text(
                      AppStrings.dashboardBudgetPercent,
                      style: GoogleFonts.poppins(
                        color: AppColors.white,
                        fontSize: 11,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(width: 12),
        Text(
          AppStrings.dashboardBudgetTarget,
          style: GoogleFonts.poppins(
            color: AppColors.white,
            fontSize: 12,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}