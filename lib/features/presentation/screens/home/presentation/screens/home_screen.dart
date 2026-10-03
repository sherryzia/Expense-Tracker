import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/home_bloc.dart';
import '../../bloc/home_event.dart';
import '../../data/repositories/expense_repository_impl.dart';
import 'home_view.dart';

/// Home screen: owns the [HomeBloc] lifecycle and renders [HomeView].
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => HomeBloc(repository: const ExpenseRepositoryImpl())
        ..add(const HomeLoadRequested()),
      child: const HomeView(),
    );
  }
}