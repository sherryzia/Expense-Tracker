import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../../core/constants/app_colors.dart';
import '../../../../../../core/constants/app_routes.dart';
import '../../../../../../core/constants/app_strings.dart';
import '../../../../../../core/extensions/context_extensions.dart';
import '../widgets/auth_link_row.dart';
import '../widgets/auth_scaffold.dart';
import '../widgets/auth_submit_button.dart';
import '../widgets/auth_text_field.dart';

/// Create Account screen.
class CreateAccountScreen extends StatelessWidget {
  const CreateAccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AuthScaffold(
      title: AppStrings.createAccountTitle,
      children: <Widget>[
        const AuthTextField(
          label: AppStrings.createFullNameLabel,
          hint: AppStrings.createHintFullName,
        ),
        const SizedBox(height: 16),
        const AuthTextField(
          label: AppStrings.createEmailLabel,
          hint: AppStrings.loginHintEmail,
          keyboardType: TextInputType.emailAddress,
        ),
        const SizedBox(height: 16),
        const AuthTextField(
          label: AppStrings.createMobileLabel,
          hint: AppStrings.createHintMobile,
          keyboardType: TextInputType.phone,
        ),
        const SizedBox(height: 16),
        const AuthTextField(
          label: AppStrings.createDobLabel,
          hint: AppStrings.createHintDob,
        ),
        const SizedBox(height: 16),
        const AuthTextField(
          label: AppStrings.createPasswordLabel,
          isPassword: true,
          hiddenInitially: true,
        ),
        const SizedBox(height: 16),
        const AuthTextField(
          label: AppStrings.createConfirmPasswordLabel,
          isPassword: true,
          hiddenInitially: true,
          textInputAction: TextInputAction.done,
        ),
        const SizedBox(height: 20),
        _TermsNotice(),
        const SizedBox(height: 24),
        AuthSubmitButton(
          label: AppStrings.authSignUp,
          onPressed: () => context.showAppSnackBar(AppStrings.authPlaceholder),
        ),
        const SizedBox(height: 24),
        AuthLinkRow(
          prefix: AppStrings.createAlreadyAccount,
          link: AppStrings.createLoginLink,
          onLinkPressed: () =>
              Navigator.of(context).pushNamed(AppRoutes.login),
        ),
      ],
    );
  }
}

/// Small centered legal disclaimer above the submit button.
class _TermsNotice extends StatelessWidget {
  const _TermsNotice();

  @override
  Widget build(BuildContext context) {
    final TextStyle baseStyle = GoogleFonts.poppins(
      color: AppColors.textSecondary,
      fontSize: 12,
      fontWeight: FontWeight.w400,
    );
    final TextStyle strongStyle = GoogleFonts.poppins(
      color: AppColors.textPrimary,
      fontSize: 12,
      fontWeight: FontWeight.w600,
    );

    return Text.rich(
      TextSpan(
        text: AppStrings.createTermsPrefix,
        style: baseStyle,
        children: <InlineSpan>[
          TextSpan(text: AppStrings.createTermsOfUse, style: strongStyle),
          TextSpan(text: AppStrings.createTermsAnd, style: baseStyle),
          TextSpan(text: AppStrings.createPrivacyPolicy, style: strongStyle),
        ],
      ),
      textAlign: TextAlign.center,
    );
  }
}