import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../../core/constants/app_colors.dart';
import '../../../../../../core/constants/app_strings.dart';

/// Two-column balance / expense stats shown in the mint header.
class BalanceStatsRow extends StatelessWidget {
  const BalanceStatsRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        const Expanded(
          child: _BalanceStat(
            icon: Icons.arrow_upward_rounded,
            iconColor: AppColors.darkGreen,
            label: AppStrings.dashboardTotalBalance,
            value: AppStrings.dashboardBalanceAmount,
            valueColor: AppColors.darkGreen,
          ),
        ),
        const Expanded(
          child: _BalanceStat(
            icon: Icons.arrow_downward_rounded,
            iconColor: AppColors.link,
            label: AppStrings.dashboardTotalExpense,
            value: AppStrings.dashboardExpenseAmount,
            valueColor: AppColors.link,
          ),
        ),
      ],
    );
  }
}

/// Value / label pair used inside the header stats row.
class _BalanceStat extends StatelessWidget {
  const _BalanceStat({
    required this.icon,
    required this.iconColor,
    required this.label,
    required this.value,
    required this.valueColor,
  });

  final IconData icon;
  final Color iconColor;
  final String label;
  final String value;
  final Color valueColor;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Icon(icon, color: iconColor, size: 16),
        const SizedBox(width: 8),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                label,
                style: GoogleFonts.poppins(
                  color: AppColors.darkGreen.withValues(alpha: 0.65),
                  fontSize: 11,
                  fontWeight: FontWeight.w400,
                ),
              ),
              Text(
                value,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: GoogleFonts.poppins(
                  color: valueColor,
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}