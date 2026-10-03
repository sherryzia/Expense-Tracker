import 'package:equatable/equatable.dart';

import '../../../../../core/enums/status.dart';
import '../domain/entities/expense.dart';

/// UI state of the home screen.
class HomeState extends Equatable {
  const HomeState({
    this.status = Status.idle,
    this.expenses = const <Expense>[],
    this.message,
  });

  final Status status;
  final List<Expense> expenses;
  final String? message;

  double get balance =>
      expenses.fold<double>(0, (sum, expense) => sum + expense.signedAmount);

  HomeState copyWith({
    Status? status,
    List<Expense>? expenses,
    String? message,
  }) {
    return HomeState(
      status: status ?? this.status,
      expenses: expenses ?? this.expenses,
      message: message ?? this.message,
    );
  }

  @override
  List<Object?> get props => [status, expenses, message];
}