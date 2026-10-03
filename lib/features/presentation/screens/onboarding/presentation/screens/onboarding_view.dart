import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../../core/constants/app_colors.dart';
import '../../../../../../core/constants/app_constants.dart';
import '../../../../../../core/constants/app_routes.dart';
import '../../../../../../core/constants/app_strings.dart';
import '../../bloc/onboarding_bloc.dart';
import '../../bloc/onboarding_event.dart';
import '../../bloc/onboarding_state.dart';
import '../widgets/onboarding_action_button.dart';
import '../widgets/onboarding_page.dart';
import '../widgets/onboarding_page_indicator.dart';

/// Body of the onboarding flow; navigates to the landing on completion.
class OnboardingView extends StatelessWidget {
  const OnboardingView({super.key, required this.pageController});

  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    return BlocListener<OnboardingBloc, OnboardingState>(
      listenWhen: (OnboardingState previous, OnboardingState current) =>
          current.finish && !previous.finish,
      listener: (BuildContext context, OnboardingState state) {
        Navigator.of(context).pushReplacementNamed(AppRoutes.landing);
      },
      child: Scaffold(
        backgroundColor: AppColors.backgroundMint,
        body: SafeArea(
          child: Column(
            children: <Widget>[
              Expanded(
                child: PageView.builder(
                  controller: pageController,
                  itemCount: AppConstants.onboardingPageCount,
                  onPageChanged: (int page) => context
                      .read<OnboardingBloc>()
                      .add(OnboardingPageChanged(page)),
                  itemBuilder: (BuildContext context, int index) {
                    return OnboardingPage(
                      title: AppStrings.onboardingTitles[index],
                      subtitle: AppStrings.onboardingSubtitles[index],
                    );
                  },
                ),
              ),
              BlocBuilder<OnboardingBloc, OnboardingState>(
                builder: (BuildContext context, OnboardingState state) {
                  return Column(
                    children: <Widget>[
                      OnboardingPageIndicator(currentPage: state.page),
                      const SizedBox(height: 24),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: AppConstants.layoutPadding,
                        ),
                        child: Row(
                          children: <Widget>[
                            TextButton(
                              onPressed: () => context
                                  .read<OnboardingBloc>()
                                  .add(const OnboardingSkipRequested()),
                              child: Text(
                                AppStrings.onboardingSkip,
                                style: GoogleFonts.leagueSpartan(
                                  color: AppColors.inkGreen,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            const Spacer(),
                            OnboardingActionButton(
                              label: state.isLastPage
                                  ? AppStrings.onboardingGetStarted
                                  : AppStrings.onboardingNext,
                              onPressed: () => context
                                  .read<OnboardingBloc>()
                                  .add(const OnboardingNextRequested()),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 16),
                    ],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}