import 'package:flutter/material.dart';

import '../../../../../../core/extensions/context_extensions.dart';
import '../../../../../../core/utils/currency_formatter.dart';
import '../../../../../../core/utils/date_formatter.dart';
import '../../domain/entities/expense.dart';

/// Icon mapped from an [ExpenseCategory].
IconData categoryIcon(ExpenseCategory category) {
  switch (category) {
    case ExpenseCategory.food:
      return Icons.restaurant;
    case ExpenseCategory.transport:
      return Icons.directions_bus;
    case ExpenseCategory.shopping:
      return Icons.shopping_bag;
    case ExpenseCategory.utilities:
      return Icons.bolt;
    case ExpenseCategory.entertainment:
      return Icons.movie;
    case ExpenseCategory.other:
      return Icons.category;
  }
}

/// Single expense row in the overview list.
class ExpenseTile extends StatelessWidget {
  const ExpenseTile({super.key, required this.expense});

  final Expense expense;

  @override
  Widget build(BuildContext context) {
    final Color amountColor = expense.isIncome
        ? context.colorScheme.primary
        : context.colorScheme.error;

    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: CircleAvatar(
        backgroundColor: context.colorScheme.secondaryContainer,
        foregroundColor: context.colorScheme.onSecondaryContainer,
        child: Icon(categoryIcon(expense.category)),
      ),
      title: Text(
        expense.title,
        style: context.textTheme.bodyLarge
            ?.copyWith(fontWeight: FontWeight.w600),
      ),
      subtitle: Text(
        DateFormatter.iso(expense.date),
        style: context.textTheme.bodySmall
            ?.copyWith(color: context.colorScheme.onSurfaceVariant),
      ),
      trailing: Text(
        CurrencyFormatter.signed(expense.signedAmount),
        style: TextStyle(
          color: amountColor,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}