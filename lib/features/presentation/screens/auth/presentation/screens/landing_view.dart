import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../../core/constants/app_colors.dart';
import '../../../../../../core/constants/app_routes.dart';
import '../../../../../../core/constants/app_strings.dart';
import '../../../../../../core/extensions/context_extensions.dart';
import '../../../../../../core/widgets/finwise_logo.dart';
import '../../bloc/auth_bloc.dart';
import '../../bloc/auth_event.dart';
import '../../bloc/auth_state.dart';
import '../widgets/auth_action_button.dart';

/// Body of the landing screen (FinWise brand + auth actions).
class LandingView extends StatelessWidget {
  const LandingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundMint,
      body: SafeArea(
        child: BlocListener<AuthBloc, AuthState>(
          listener: (BuildContext context, AuthState state) {
            if (state.action == AuthAction.none) return;
            switch (state.action) {
              case AuthAction.login:
                Navigator.of(context).pushNamed(AppRoutes.login);
                break;
              case AuthAction.signUp:
                Navigator.of(context).pushNamed(AppRoutes.createAccount);
                break;
              case AuthAction.forgotPassword:
                context.showAppSnackBar(AppStrings.authPlaceholder);
                break;
              case AuthAction.none:
                break;
            }
            context.read<AuthBloc>().add(const AuthActionConsumed());
          },
          child: Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  const FinWiseLogo(
                    color: AppColors.primary,
                    width: 109,
                    height: 114.78,
                  ),
                  const SizedBox(height: 12),
                  Text(
                    AppStrings.authTitle,
                    style: GoogleFonts.poppins(
                      color: AppColors.primary,
                      fontSize: 52.14,
                      fontWeight: FontWeight.w600,
                      height: 57.36 / 52.14,
                    ),
                  ),
                  const SizedBox(height: 3),
                  SizedBox(
                    width: 236,
                    child: Text(
                      AppStrings.authSubtitle,
                      textAlign: TextAlign.center,
                      style: GoogleFonts.leagueSpartan(
                        color: AppColors.subtext,
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  const SizedBox(height: 42),
                  AuthActionButton(
                    label: AppStrings.authLogin,
                    onPressed: () =>
                        context.read<AuthBloc>().add(const AuthLoginRequested()),
                  ),
                  const SizedBox(height: 12),
                  AuthActionButton(
                    label: AppStrings.authSignUp,
                    variant: AuthButtonVariant.quiet,
                    onPressed: () =>
                        context.read<AuthBloc>().add(const AuthSignUpRequested()),
                  ),
                  const SizedBox(height: 12),
                  TextButton(
                    onPressed: () => context
                        .read<AuthBloc>()
                        .add(const AuthForgotPasswordRequested()),
                    child: Text(
                      AppStrings.authForgotPassword,
                      style: GoogleFonts.leagueSpartan(
                        color: AppColors.inkGreen,
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
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