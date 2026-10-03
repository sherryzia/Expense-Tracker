import '../entities/expense.dart';

/// Contract for accessing expense data from the home feature.
abstract interface class ExpenseRepository {
  Future<List<Expense>> fetchExpenses();
}