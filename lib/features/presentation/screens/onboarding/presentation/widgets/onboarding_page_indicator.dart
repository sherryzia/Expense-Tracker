import 'package:flutter/material.dart';

import '../../../../../../core/constants/app_colors.dart';
import '../../../../../../core/constants/app_constants.dart';

/// Dots showing the current onboarding page; the active one stretches.
class OnboardingPageIndicator extends StatelessWidget {
  const OnboardingPageIndicator({super.key, required this.currentPage});

  final int currentPage;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List<Widget>.generate(
        AppConstants.onboardingPageCount,
        (int index) {
          final bool isActive = index == currentPage;
          return AnimatedContainer(
            duration: AppConstants.pageTransition,
            curve: Curves.easeOut,
            margin: const EdgeInsets.symmetric(horizontal: 4),
            width: isActive ? 28 : 8,
            height: 8,
            decoration: BoxDecoration(
              color: isActive ? AppColors.primary : AppColors.primaryTint,
              borderRadius: BorderRadius.circular(4),
            ),
          );
        },
      ),
    );
  }
}