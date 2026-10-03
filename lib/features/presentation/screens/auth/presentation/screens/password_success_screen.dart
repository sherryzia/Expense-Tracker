import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../../core/constants/app_colors.dart';
import '../../../../../../core/constants/app_routes.dart';
import '../../../../../../core/constants/app_strings.dart';

/// Full-bleed success state shown after a password change.
///
/// Unlike the other auth screens there is no white card; the whole
/// background is the brand mint.
class PasswordSuccessScreen extends StatelessWidget {
  const PasswordSuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  const _SuccessCircle(),
                  const SizedBox(height: 32),
                  Text(
                    AppStrings.passwordChangedSuccess,
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                      color: AppColors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.w600,
                      height: 1.4,
                    ),
                  ),
                  const SizedBox(height: 48),
                  SizedBox(
                    width: 207,
                    height: 56,
                    child: FilledButton(
                      onPressed: () => Navigator.of(context)
                          .pushNamedAndRemoveUntil(
                        AppRoutes.login,
                        (Route<dynamic> route) => false,
                      ),
                      style: FilledButton.styleFrom(
                        backgroundColor: AppColors.white,
                        foregroundColor: AppColors.inkGreen,
                        elevation: 0,
                        shape: const StadiumBorder(),
                        textStyle: GoogleFonts.poppins(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      child: Text(AppStrings.passwordChangedContinue),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

/// White completion circle with a small off-center mark.
class _SuccessCircle extends StatelessWidget {
  const _SuccessCircle();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 120,
      height: 120,
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Container(
            width: 120,
            height: 120,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.white,
            ),
          ),
          Positioned(
            right: 34,
            top: 32,
            child: Container(
              width: 16,
              height: 16,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.primary,
              ),
            ),
          ),
        ],
      ),
    );
  }
}