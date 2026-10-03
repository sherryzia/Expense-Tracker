import 'package:equatable/equatable.dart';

/// Events consumed by [SplashBloc].
abstract class SplashEvent extends Equatable {
  const SplashEvent();

  @override
  List<Object?> get props => [];
}

/// Signals that the splash sequence should begin.
class SplashStarted extends SplashEvent {
  const SplashStarted();
}