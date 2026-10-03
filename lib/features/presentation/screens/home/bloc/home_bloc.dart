import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/constants/app_strings.dart';
import '../../../../../core/enums/status.dart';
import '../domain/entities/expense.dart';
import '../domain/repositories/expense_repository.dart';
import 'home_event.dart';
import 'home_state.dart';

/// Orchestrates the home screen state from [ExpenseRepository].
class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc({required ExpenseRepository repository})
      : _repository = repository,
        super(const HomeState()) {
    on<HomeLoadRequested>(_onLoadRequested);
  }

  final ExpenseRepository _repository;

  Future<void> _onLoadRequested(
    HomeLoadRequested event,
    Emitter<HomeState> emit,
  ) async {
    emit(state.copyWith(status: Status.loading));
    try {
      final List<Expense> expenses = await _repository.fetchExpenses();
      emit(
        state.copyWith(
          status: Status.success,
          expenses: expenses,
          message: null,
        ),
      );
    } catch (error) {
      emit(state.copyWith(status: Status.failure, message: AppStrings.homeLoadError));
    }
  }
}