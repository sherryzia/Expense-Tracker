import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/constants/app_constants.dart';
import 'onboarding_event.dart';
import 'onboarding_state.dart';

/// Drives the onboarding [PageView] and finalizes the flow.
class OnboardingBloc extends Bloc<OnboardingEvent, OnboardingState> {
  OnboardingBloc({required PageController pageController})
      : _pageController = pageController,
        super(const OnboardingState()) {
    on<OnboardingPageChanged>(_onPageChanged);
    on<OnboardingNextRequested>(_onNextRequested);
    on<OnboardingSkipRequested>(
      (event, emit) => emit(state.copyWith(finish: true)),
    );
  }

  final PageController _pageController;

  Future<void> _onPageChanged(
    OnboardingPageChanged event,
    Emitter<OnboardingState> emit,
  ) async {
    if (event.page == state.page || state.finish) return;
    emit(
      state.copyWith(
        page: event.page,
        isLastPage: event.page == AppConstants.onboardingPageCount - 1,
      ),
    );
  }

  Future<void> _onNextRequested(
    OnboardingNextRequested event,
    Emitter<OnboardingState> emit,
  ) async {
    if (state.isLastPage) {
      emit(state.copyWith(finish: true));
      return;
    }
    if (state.page < AppConstants.onboardingPageCount - 1) {
      final int next = state.page + 1;
      await _pageController.animateToPage(
        next,
        duration: AppConstants.pageTransition,
        curve: Curves.easeOutCubic,
      );
      _onPageChanged(OnboardingPageChanged(next), emit);
    }
  }
}