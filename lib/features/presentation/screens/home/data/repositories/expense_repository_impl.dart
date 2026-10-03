import '../../domain/entities/expense.dart';
import '../../domain/repositories/expense_repository.dart';
import '../models/expense_model.dart';

/// Concrete implementation of [ExpenseRepository].
///
/// TODO: replace the local sample with calls through
/// `core/data/dataSources/api_client.dart` once the API is available.
class ExpenseRepositoryImpl implements ExpenseRepository {
  const ExpenseRepositoryImpl();

  static final List<ExpenseModel> _sample = [
    ExpenseModel(
      id: '1',
      title: 'Groceries',
      amount: 86.4,
      category: ExpenseCategory.food,
      date: DateTime(2026, 9, 20),
    ),
    ExpenseModel(
      id: '2',
      title: 'Metro card',
      amount: 12.0,
      category: ExpenseCategory.transport,
      date: DateTime(2026, 9, 19),
    ),
    ExpenseModel(
      id: '3',
      title: 'Freelance payment',
      amount: 450.0,
      category: ExpenseCategory.other,
      date: DateTime(2026, 9, 18),
      isIncome: true,
    ),
    ExpenseModel(
      id: '4',
      title: 'Electricity bill',
      amount: 64.15,
      category: ExpenseCategory.utilities,
      date: DateTime(2026, 9, 15),
    ),
  ];

  @override
  Future<List<Expense>> fetchExpenses() async {
    return _sample.map((ExpenseModel model) => model.toEntity()).toList();
  }
}