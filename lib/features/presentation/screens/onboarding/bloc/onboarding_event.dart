import 'package:equatable/equatable.dart';

/// Events consumed by [OnboardingBloc].
abstract class OnboardingEvent extends Equatable {
  const OnboardingEvent();

  @override
  List<Object?> get props => [];
}

/// The page view settled on page [page] (via swipe or animation).
class OnboardingPageChanged extends OnboardingEvent {
  const OnboardingPageChanged(this.page);

  final int page;

  @override
  List<Object?> get props => [page];
}

/// Advances one page; on the last page it finishes onboarding.
class OnboardingNextRequested extends OnboardingEvent {
  const OnboardingNextRequested();
}

/// Skips onboarding immediately.
class OnboardingSkipRequested extends OnboardingEvent {
  const OnboardingSkipRequested();
}