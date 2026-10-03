import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../../core/constants/app_colors.dart';
import '../../../../../../core/constants/app_routes.dart';
import '../../../../../../core/constants/app_strings.dart';
import '../widgets/auth_link_row.dart';
import '../widgets/auth_scaffold.dart';
import '../widgets/auth_social_row.dart';
import '../widgets/auth_submit_button.dart';
import '../widgets/auth_text_field.dart';

/// Login / Welcome screen.
class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AuthScaffold(
      title: AppStrings.loginWelcome,
      children: <Widget>[
        const AuthTextField(
          label: AppStrings.loginUsernameLabel,
          hint: AppStrings.loginHintEmail,
          keyboardType: TextInputType.emailAddress,
        ),
        const SizedBox(height: 20),
        const AuthTextField(
          label: AppStrings.loginPasswordLabel,
          isPassword: true,
          hiddenInitially: true,
          textInputAction: TextInputAction.done,
        ),
        const SizedBox(height: 28),
        AuthSubmitButton(
          label: AppStrings.authLogin,
          onPressed: () => Navigator.of(context).pushNamedAndRemoveUntil(
            AppRoutes.home,
            (Route<dynamic> route) => false,
          ),
        ),
        const SizedBox(height: 8),
        TextButton(
          onPressed: () =>
              Navigator.of(context).pushNamed(AppRoutes.forgotPassword),
          child: Text(
            AppStrings.authForgotPassword,
            style: GoogleFonts.poppins(
              color: AppColors.inkGreen,
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        const SizedBox(height: 8),
        AuthSubmitButton(
          label: AppStrings.authSignUp,
          variant: AuthSubmitVariant.quiet,
          onPressed: () =>
              Navigator.of(context).pushNamed(AppRoutes.createAccount),
        ),
        const SizedBox(height: 28),
        TextButton.icon(
          onPressed: () =>
              Navigator.of(context).pushNamed(AppRoutes.securityFingerprint),
          icon: const Icon(
            Icons.fingerprint,
            color: AppColors.inkGreen,
            size: 20,
          ),
          label: Text(
            AppStrings.loginUseFingerprint,
            style: GoogleFonts.leagueSpartan(
              color: AppColors.inkGreen,
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        const SizedBox(height: 24),
        const AuthSocialRow(),
        const SizedBox(height: 16),
        AuthLinkRow(
          prefix: AppStrings.loginNoAccount,
          link: AppStrings.loginSignUpLink,
          onLinkPressed: () =>
              Navigator.of(context).pushNamed(AppRoutes.createAccount),
        ),
      ],
    );
  }
}