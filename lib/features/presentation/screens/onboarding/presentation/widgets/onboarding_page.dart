import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../../core/constants/app_colors.dart';
import '../../../../../../core/constants/app_constants.dart';
import '../../../../../../core/widgets/finwise_logo.dart';

/// A single onboarding page: brand illustration + headline + subtext.
class OnboardingPage extends StatelessWidget {
  const OnboardingPage({
    super.key,
    required this.title,
    required this.subtitle,
  });

  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    final double logoHeight =
        AppConstants.onboardingLogoWidth * 124 / 118;

    return Center(
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 32),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            FinWiseLogo(
              color: AppColors.primary,
              width: AppConstants.onboardingLogoWidth,
              height: logoHeight,
            ),
            const SizedBox(height: 32),
            Text(
              title,
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(
                color: AppColors.primary,
                fontSize: 28,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              subtitle,
              textAlign: TextAlign.center,
              style: GoogleFonts.leagueSpartan(
                color: AppColors.subtext,
                fontSize: 14,
                fontWeight: FontWeight.w400,
                height: 1.5,
              ),
            ),
          ],
        ),
      ),
    );
  }
}