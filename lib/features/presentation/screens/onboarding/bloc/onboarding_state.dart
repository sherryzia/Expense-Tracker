import 'package:equatable/equatable.dart';

/// UI state of the onboarding flow.
class OnboardingState extends Equatable {
  const OnboardingState({
    this.page = 0,
    this.isLastPage = false,
    this.finish = false,
  });

  final int page;
  final bool isLastPage;
  final bool finish;

  OnboardingState copyWith({int? page, bool? isLastPage, bool? finish}) {
    return OnboardingState(
      page: page ?? this.page,
      isLastPage: isLastPage ?? this.isLastPage,
      finish: finish ?? this.finish,
    );
  }

  @override
  List<Object?> get props => [page, isLastPage, finish];
}