import 'package:equatable/equatable.dart';

/// Expense categories used across the home feature.
enum ExpenseCategory { food, transport, shopping, utilities, entertainment, other }

/// Feature-agnostic UI model shown on the home screen.
class Expense extends Equatable {
  const Expense({
    required this.id,
    required this.title,
    required this.amount,
    required this.category,
    required this.date,
    this.isIncome = false,
  });

  final String id;
  final String title;
  final double amount;
  final ExpenseCategory category;
  final DateTime date;
  final bool isIncome;

  double get signedAmount => isIncome ? amount : -amount;

  @override
  List<Object?> get props => [id, title, amount, category, date, isIncome];
}