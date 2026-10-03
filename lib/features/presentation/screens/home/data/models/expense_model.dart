import '../../domain/entities/expense.dart';

/// Wire model matching the expenses API payload.
class ExpenseModel {
  const ExpenseModel({
    required this.id,
    required this.title,
    required this.amount,
    required this.category,
    required this.date,
    this.isIncome = false,
  });

  factory ExpenseModel.fromJson(Map<String, dynamic> json) => ExpenseModel(
        id: json['id'] as String,
        title: json['title'] as String,
        amount: (json['amount'] as num).toDouble(),
        category: ExpenseCategory.values.byName(json['category'] as String),
        date: DateTime.parse(json['date'] as String),
        isIncome: json['isIncome'] as bool? ?? false,
      );

  final String id;
  final String title;
  final double amount;
  final ExpenseCategory category;
  final DateTime date;
  final bool isIncome;

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'amount': amount,
        'category': category.name,
        'date': date.toIso8601String(),
        'isIncome': isIncome,
      };

  Expense toEntity() => Expense(
        id: id,
        title: title,
        amount: amount,
        category: category,
        date: date,
        isIncome: isIncome,
      );
}