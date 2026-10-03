import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/constants/app_constants.dart';
import 'splash_event.dart';
import 'splash_state.dart';

/// Counts down the splash display and signals navigation to the next screen.
class SplashBloc extends Bloc<SplashEvent, SplashState> {
  SplashBloc() : super(const SplashState()) {
    on<SplashStarted>(_onStarted);
  }

  Future<void> _onStarted(
    SplashStarted event,
    Emitter<SplashState> emit,
  ) async {
    await Future<void>.delayed(AppConstants.splashDisplay);
    emit(const SplashState(navigate: true));
  }
}