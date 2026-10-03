import 'package:flutter/material.dart';

import '../../../../../../core/constants/app_constants.dart';
import '../../../../../../core/constants/app_strings.dart';
import '../../../../../../core/extensions/context_extensions.dart';
import '../../../../../../core/utils/currency_formatter.dart';

/// Highlighted balance summary shown at the top of the overview.
class BalanceCard extends StatelessWidget {
  const BalanceCard({super.key, required this.balance});

  final double balance;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(AppConstants.layoutPadding),
      decoration: BoxDecoration(
        color: context.colorScheme.primary,
        borderRadius: BorderRadius.circular(AppConstants.componentRadius),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            AppStrings.homeBalanceLabel,
            style: context.textTheme.labelLarge
                ?.copyWith(color: context.colorScheme.onPrimary),
          ),
          const SizedBox(height: AppConstants.layoutPaddingSmall),
          Text(
            CurrencyFormatter.format(balance),
            style: context.textTheme.headlineMedium?.copyWith(
              color: context.colorScheme.onPrimary,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}