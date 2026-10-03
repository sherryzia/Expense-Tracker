import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../../core/constants/app_colors.dart';
import '../../../../../../core/constants/app_routes.dart';
import '../../../../../../core/constants/app_strings.dart';
import '../../../../../../core/widgets/finwise_logo.dart';
import '../../bloc/splash_bloc.dart';
import '../../bloc/splash_state.dart';

/// Body of the splash screen; navigates to the landing once timed out.
class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SplashBloc, SplashState>(
      listenWhen: (SplashState previous, SplashState current) =>
          current.navigate && !previous.navigate,
      listener: (BuildContext context, SplashState state) {
        Navigator.of(context).pushReplacementNamed(AppRoutes.onboarding);
      },
      child: Scaffold(
        backgroundColor: AppColors.primary,
        body: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  const FinWiseLogo(
                    color: AppColors.darkGreen,
                    width: 109,
                    height: 114.78,
                  ),
                  const SizedBox(height: 12),
                  Text(
                    AppStrings.splashTitle,
                    style: GoogleFonts.poppins(
                      color: AppColors.white,
                      fontSize: 52.14,
                      fontWeight: FontWeight.w600,
                      height: 57.36 / 52.14,
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