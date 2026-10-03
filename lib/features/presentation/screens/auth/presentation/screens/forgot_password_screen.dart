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

/// Forgot Password screen — starts the password reset flow.
class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AuthScaffold(
      title: AppStrings.forgotPasswordTitle,
      children: <Widget>[
        Text(
          AppStrings.forgotHeading,
          style: GoogleFonts.poppins(
            color: AppColors.textPrimary,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          AppStrings.forgotDescription,
          style: GoogleFonts.leagueSpartan(
            color: AppColors.subtext,
            fontSize: 14,
            fontWeight: FontWeight.w400,
            height: 1.5,
          ),
        ),
        const SizedBox(height: 24),
        const AuthTextField(
          label: AppStrings.forgotEmailLabel,
          hint: AppStrings.loginHintEmail,
          keyboardType: TextInputType.emailAddress,
          textInputAction: TextInputAction.done,
        ),
        const SizedBox(height: 28),
        AuthSubmitButton(
          label: AppStrings.forgotNextStep,
          onPressed: () =>
              Navigator.of(context).pushNamed(AppRoutes.securityPin),
        ),
        const SizedBox(height: 20),
        AuthSubmitButton(
          label: AppStrings.authSignUp,
          variant: AuthSubmitVariant.quiet,
          onPressed: () =>
              Navigator.of(context).pushNamed(AppRoutes.createAccount),
        ),
        const SizedBox(height: 28),
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