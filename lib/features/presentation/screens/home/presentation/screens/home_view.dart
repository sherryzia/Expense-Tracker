import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/constants/app_constants.dart';
import '../../../../../../core/constants/app_strings.dart';
import '../../../../../../core/enums/status.dart';
import '../../../../../../core/extensions/context_extensions.dart';
import '../../../../../../core/widgets/app_error_view.dart';
import '../../../../../../core/widgets/app_loading_indicator.dart';
import '../../bloc/home_bloc.dart';
import '../../bloc/home_event.dart';
import '../../bloc/home_state.dart';
import '../../domain/entities/expense.dart';
import '../widgets/balance_card.dart';
import '../widgets/expense_tile.dart';

/// Stateless body of the home screen, driven by [HomeState].
class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text(AppStrings.homeTitle)),
      body: SafeArea(
        child: BlocBuilder<HomeBloc, HomeState>(
          builder: (BuildContext context, HomeState state) {
            switch (state.status) {
              case Status.idle:
              case Status.loading:
                return AppLoadingIndicator(message: AppStrings.loading);
              case Status.failure:
                return AppErrorView(
                  message: state.message ?? AppStrings.homeLoadError,
                  onRetry: () => context
                      .read<HomeBloc>()
                      .add(const HomeLoadRequested()),
                );
              case Status.success:
                return _buildOverview(context, state);
            }
          },
        ),
      ),
    );
  }

  Widget _buildOverview(BuildContext context, HomeState state) {
    if (state.expenses.isEmpty) {
      return Center(
        child: Text(
          AppStrings.homeEmptyMessage,
          style: context.textTheme.bodyMedium,
        ),
      );
    }

    return RefreshIndicator(
      onRefresh: () async =>
          context.read<HomeBloc>().add(const HomeLoadRequested()),
      child: ListView(
        physics: const AlwaysScrollableScrollPhysics(),
        padding: const EdgeInsets.all(AppConstants.layoutPadding),
        children: <Widget>[
          BalanceCard(balance: state.balance),
          const SizedBox(height: AppConstants.componentSpacing),
          ...state.expenses.map(
            (Expense expense) => ExpenseTile(expense: expense),
          ),
        ],
      ),
    );
  }
}