import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../../core/constants/app_colors.dart';

/// One transaction list row with blue circular icon.
class TransactionRow extends StatelessWidget {
  const TransactionRow({
    super.key,
    required this.icon,
    required this.title,
    required this.time,
    required this.category,
    required this.amount,
    this.isIncomePositive = false,
  });

  final IconData icon;
  final String title;
  final String time;
  final String category;
  final String amount;
  final bool isIncomePositive;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        children: <Widget>[
          DecoratedBox(
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.link,
            ),
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Icon(icon, color: AppColors.white, size: 20),
            ),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  title,
                  style: GoogleFonts.poppins(
                    color: AppColors.textPrimary,
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 3),
                Row(
                  children: <Widget>[
                    Text(
                      time,
                      style: GoogleFonts.poppins(
                        color: AppColors.textSecondary,
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Text(
                      '   •   ',
                      style: GoogleFonts.poppins(
                        color: AppColors.textSecondary,
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Text(
                      category,
                      style: GoogleFonts.poppins(
                        color: AppColors.textSecondary,
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Text(
            amount,
            style: GoogleFonts.poppins(
              color: isIncomePositive ? AppColors.income : AppColors.expense,
              fontSize: 15,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}

/// Thin separator between transaction rows.
class TransactionDivider extends StatelessWidget {
  const TransactionDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return const Divider(height: 1, thickness: 1, color: AppColors.border);
  }
}