import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../../core/constants/app_colors.dart';
import '../../../../../../core/constants/app_routes.dart';
import '../../../../../../core/constants/app_strings.dart';
import '../widgets/balance_stats_row.dart';
import '../widgets/bottom_nav_bar.dart';
import '../widgets/budget_progress_bar.dart';
import '../widgets/insight_message.dart';
import '../widgets/transaction_row.dart';

/// Main finance dashboard.
///
/// Mint header (top ~36%) holds greeting + balance stats + budget progress;
/// an overlapping white card with rounded top corners hosts the summary,
/// timeframe selector, transaction history and a floating bottom nav.
class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.surface,
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.dark,
        child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            final double headerHeight = constraints.maxHeight * 0.36;
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
                                const _SummaryCard(),
                                const SizedBox(height: 24),
                                const _TimeframeSelector(),
                                const SizedBox(height: 24),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Text(
                                      AppStrings.dashboardTransactionHistory,
                                      style: GoogleFonts.poppins(
                                        color: AppColors.textPrimary,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    TextButton(
                                      onPressed: () => Navigator.of(context)
                                          .pushNamed(AppRoutes.accountBalance),
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
                                const SizedBox(height: 4),
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
                                const SizedBox(height: 24),
                              ],
                            ),
                          ),
                        ),
                        const BottomNavBar(activeIndex: 0),
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

/// Mint top section: greeting, balance stats, budget progress and insight.
class _HeaderSection extends StatelessWidget {
  const _HeaderSection();

  @override
  Widget build(BuildContext context) {
    final double topInset = MediaQuery.paddingOf(context).top;

    return Container(
      color: AppColors.primary,
      padding: EdgeInsets.fromLTRB(24, topInset + 16, 24, 0),
      child: Column(
        children: <Widget>[
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      AppStrings.dashboardGreeting,
                      style: GoogleFonts.poppins(
                        color: AppColors.darkGreen,
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      AppStrings.dashboardGoodMorning,
                      style: GoogleFonts.poppins(
                        color:
                            AppColors.darkGreen.withValues(alpha: 0.65),
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
              DecoratedBox(
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.white,
                ),
                child: IconButton(
                  onPressed: () =>
                      Navigator.of(context).pushNamed(AppRoutes.notifications),
                  icon: const Icon(
                    Icons.notifications_none_rounded,
                    color: AppColors.darkGreen,
                  ),
                  constraints:
                      const BoxConstraints.tightFor(width: 40, height: 40),
                  padding: EdgeInsets.zero,
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          const BalanceStatsRow(),
          const SizedBox(height: 20),
          const BudgetProgressBar(),
          const SizedBox(height: 14),
          const InsightMessage(),
        ],
      ),
    );
  }
}

/// Mint accent card: savings ring + revenue / food stats.
class _SummaryCard extends StatelessWidget {
  const _SummaryCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.primary,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Row(
        children: <Widget>[
          Expanded(
            flex: 5,
            child: Column(
              children: <Widget>[
                SizedBox(
                  width: 58,
                  height: 58,
                  child: Stack(
                    fit: StackFit.expand,
                    children: <Widget>[
                      const CircularProgressIndicator(
                        value: 0.75,
                        strokeWidth: 6,
                        valueColor: AlwaysStoppedAnimation<Color>(
                          AppColors.white,
                        ),
                        backgroundColor: Color(0x40FFFFFF),
                      ),
                      const Center(
                        child: Icon(
                          Icons.directions_car_filled_rounded,
                          color: AppColors.white,
                          size: 26,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  AppStrings.dashboardSavingsOnGoals,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                    color: AppColors.white,
                    fontSize: 10,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: 1,
            height: 78,
            margin: const EdgeInsets.symmetric(horizontal: 12),
            color: AppColors.white.withValues(alpha: 0.35),
          ),
          Expanded(
            flex: 7,
            child: Column(
              children: <Widget>[
                _SummaryRow(
                  icon: Icons.account_balance_wallet_outlined,
                  label: AppStrings.dashboardRevenueLastWeek,
                  value: AppStrings.dashboardRevenueValue,
                ),
                const SizedBox(height: 14),
                _SummaryRow(
                  icon: Icons.restaurant_outlined,
                  label: AppStrings.dashboardFoodLastWeek,
                  value: AppStrings.dashboardFoodValue,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

/// Icon + label/value row inside the summary card.
class _SummaryRow extends StatelessWidget {
  const _SummaryRow({
    required this.icon,
    required this.label,
    required this.value,
  });

  final IconData icon;
  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Icon(icon, color: AppColors.white, size: 16),
        const SizedBox(width: 8),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                label,
                style: GoogleFonts.poppins(
                  color: AppColors.white.withValues(alpha: 0.8),
                  fontSize: 10,
                  fontWeight: FontWeight.w400,
                ),
              ),
              Text(
                value,
                style: GoogleFonts.poppins(
                  color: AppColors.white,
                  fontSize: 14,
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

/// Pill-shaped Daily / Weekly / Monthly filter (Monthly selected by default).
class _TimeframeSelector extends StatefulWidget {
  const _TimeframeSelector();

  @override
  State<_TimeframeSelector> createState() => _TimeframeSelectorState();
}

class _TimeframeSelectorState extends State<_TimeframeSelector> {
  static const List<String> _options = <String>[
    AppStrings.dashboardDaily,
    AppStrings.dashboardWeekly,
    AppStrings.dashboardMonthly,
  ];

  int _selected = 2;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: AppColors.inputFill,
        borderRadius: BorderRadius.circular(50),
      ),
      child: Row(
        children: List<Widget>.generate(_options.length, (int index) {
          final bool isSelected = index == _selected;
          return Expanded(
            child: GestureDetector(
              onTap: () => setState(() => _selected = index),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                curve: Curves.easeOut,
                padding: const EdgeInsets.symmetric(vertical: 8),
                decoration: BoxDecoration(
                  color: isSelected ? AppColors.primary : Colors.transparent,
                  borderRadius: BorderRadius.circular(50),
                ),
                child: Text(
                  _options[index],
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                    color: isSelected
                        ? AppColors.darkGreen
                        : AppColors.darkGreen.withValues(alpha: 0.55),
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}