import 'package:equatable/equatable.dart';

/// UI state of the splash screen.
class SplashState extends Equatable {
  const SplashState({this.navigate = false});

  final bool navigate;

  SplashState copyWith({bool? navigate}) {
    return SplashState(navigate: navigate ?? this.navigate);
  }

  @override
  List<Object?> get props => [navigate];
}