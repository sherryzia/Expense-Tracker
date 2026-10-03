import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../../core/constants/app_colors.dart';
import '../../../../../../core/constants/app_routes.dart';
import '../../../../../../core/constants/app_strings.dart';
import '../../../../../../core/extensions/context_extensions.dart';
import '../widgets/balance_stats_row.dart';
import '../widgets/bottom_nav_bar.dart';
import '../widgets/budget_progress_bar.dart';
import '../widgets/insight_message.dart';
import '../widgets/mint_app_bar_row.dart';
import '../widgets/transaction_row.dart';

/// Account Balance Details screen.
///
/// A taller mint header (~45%) holds the app bar, balance stats, budget
/// progress and an income / expense grid; the overlapping white card hosts
/// the full transaction list and a floating bottom nav.
class AccountBalanceScreen extends StatelessWidget {
  const AccountBalanceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.surface,
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.dark,
        child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            final double headerHeight = constraints.maxHeight * 0.45;
            final double cardTop = headerHeight - 64;

            return Stack(
              children: <Widget>[
                Positioned(
                  top: 0,
                  left: 0,
                  right: 0,
                  height: headerHeight,
                  child: const _HeaderSection(),
                ),
                Positioned(
                  top: cardTop,
                  left: 0,
                  right: 0,
                  bottom: 0,
                  child: DecoratedBox(
                    decoration: const BoxDecoration(
                      color: AppColors.surface,
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(40),
                      ),
                    ),
                    child: Column(
                      children: <Widget>[
                        Expanded(
                          child: SingleChildScrollView(
                            padding:
                                const EdgeInsets.fromLTRB(24, 28, 24, 16),
                            child: Column(
                              crossAxisAlignment:
                                  CrossAxisAlignment.stretch,
                              children: <Widget>[
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Text(
                                      AppStrings.transactionsTitle,
                                      style: GoogleFonts.poppins(
                                        color: AppColors.textPrimary,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    TextButton(
                                      onPressed: () => context
                                          .showAppSnackBar(
                                        AppStrings.authPlaceholder,
                                      ),
                                      style: TextButton.styleFrom(
                                        padding: EdgeInsets.zero,
                                        minimumSize: const Size(0, 0),
                                        foregroundColor: AppColors.link,
                                      ),
                                      child: Text(
                                        AppStrings.transactionsSeeAll,
                                        style: GoogleFonts.poppins(
                                          fontSize: 13,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 8),
                                const TransactionRow(
                                  icon: Icons.payments_outlined,
                                  title: AppStrings.dashboardTxSalary,
                                  time: AppStrings.dashboardTxSalaryTime,
                                  category:
                                      AppStrings.dashboardTxSalaryCategory,
                                  amount: AppStrings.dashboardTxSalaryAmount,
                                  isIncomePositive: true,
                                ),
                                const TransactionDivider(),
                                const TransactionRow(
                                  icon: Icons.shopping_basket_outlined,
                                  title: AppStrings.dashboardTxGroceries,
                                  time: AppStrings.dashboardTxGroceriesTime,
                                  category:
                                      AppStrings.dashboardTxGroceriesCategory,
                                  amount:
                                      AppStrings.dashboardTxGroceriesAmount,
                                ),
                                const TransactionDivider(),
                                const TransactionRow(
                                  icon: Icons.key_outlined,
                                  title: AppStrings.dashboardTxRent,
                                  time: AppStrings.dashboardTxRentTime,
                                  category: AppStrings.dashboardTxRentCategory,
                                  amount: AppStrings.dashboardTxRentAmount,
                                ),
                                const TransactionDivider(),
                                const TransactionRow(
                                  icon: Icons.directions_bus_outlined,
                                  title: AppStrings.dashboardTxTransport,
                                  time: AppStrings.dashboardTxTransportTime,
                                  category:
                                      AppStrings.dashboardTxTransportCategory,
                                  amount:
                                      AppStrings.dashboardTxTransportAmount,
                                ),
                                const SizedBox(height: 24),
                              ],
                            ),
                          ),
                        ),
                        const BottomNavBar(activeIndex: -1),
                      ],
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

/// Mint top section: app bar, balance stats, budget progress, income/expense
/// grid and the insight message.
class _HeaderSection extends StatelessWidget {
  const _HeaderSection();

  @override
  Widget build(BuildContext context) {
    final double topInset = MediaQuery.paddingOf(context).top;

    return Container(
      color: AppColors.primary,
      padding: EdgeInsets.fromLTRB(24, topInset + 8, 24, 0),
      child: Column(
        children: <Widget>[
          MintAppBarRow(
            title: AppStrings.accountBalanceTitle,
            onBellPressed: () =>
                Navigator.of(context).pushNamed(AppRoutes.notifications),
          ),
          const SizedBox(height: 20),
          const BalanceStatsRow(),
          const SizedBox(height: 20),
          const BudgetProgressBar(),
          const SizedBox(height: 20),
          const _IncomeExpenseGrid(),
          const SizedBox(height: 14),
          const InsightMessage(centered: true),
        ],
      ),
    );
  }
}

/// Two symmetric white cards showing income / expense totals.
class _IncomeExpenseGrid extends StatelessWidget {
  const _IncomeExpenseGrid();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: const <Widget>[
        Expanded(
          child: _IncomeExpenseCard(
            icon: Icons.north_east_rounded,
            iconColor: AppColors.income,
            label: AppStrings.accountIncomeLabel,
            value: AppStrings.accountIncomeValue,
            valueColor: AppColors.textPrimary,
          ),
        ),
        SizedBox(width: 14),
        Expanded(
          child: _IncomeExpenseCard(
            icon: Icons.south_west_rounded,
            iconColor: AppColors.link,
            label: AppStrings.accountExpenseLabel,
            value: AppStrings.accountExpenseValue,
            valueColor: AppColors.link,
          ),
        ),
      ],
    );
  }
}

/// Single white card within the income / expense grid.
class _IncomeExpenseCard extends StatelessWidget {
  const _IncomeExpenseCard({
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
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Icon(icon, color: iconColor, size: 18),
          const SizedBox(height: 10),
          Text(
            label,
            style: GoogleFonts.poppins(
              color: AppColors.textSecondary,
              fontSize: 11,
              fontWeight: FontWeight.w400,
            ),
          ),
          const SizedBox(height: 2),
          Text(
            value,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: GoogleFonts.poppins(
              color: valueColor,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}