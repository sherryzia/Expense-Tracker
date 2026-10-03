import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/splash_bloc.dart';
import '../../bloc/splash_event.dart';
import 'splash_view.dart';

/// Splash screen: owns the [SplashBloc] lifecycle and renders [SplashView].
class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => SplashBloc()..add(const SplashStarted()),
      child: const SplashView(),
    );
  }
}