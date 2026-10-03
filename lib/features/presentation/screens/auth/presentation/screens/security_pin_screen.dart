import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../../core/constants/app_colors.dart';
import '../../../../../../core/constants/app_routes.dart';
import '../../../../../../core/constants/app_strings.dart';
import '../../../../../../core/extensions/context_extensions.dart';
import '../widgets/auth_link_row.dart';
import '../widgets/auth_scaffold.dart';
import '../widgets/auth_social_row.dart';
import '../widgets/auth_submit_button.dart';
import '../widgets/pin_input.dart';

/// Security Pin screen — six-digit entry for the reset flow.
class SecurityPinScreen extends StatelessWidget {
  const SecurityPinScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AuthScaffold(
      title: AppStrings.securityPinTitle,
      children: <Widget>[
        const SizedBox(height: 8),
        Text(
          AppStrings.securityPinEnterPin,
          textAlign: TextAlign.center,
          style: GoogleFonts.poppins(
            color: AppColors.textPrimary,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 28),
        const PinInput(),
        const SizedBox(height: 32),
        AuthSubmitButton(
          label: AppStrings.securityPinAccept,
          onPressed: () =>
              Navigator.of(context).pushNamed(AppRoutes.newPassword),
        ),
        const SizedBox(height: 8),
        TextButton(
          onPressed: () =>
              context.showAppSnackBar(AppStrings.authPlaceholder),
          child: Text(
            AppStrings.securityPinSendAgain,
            style: GoogleFonts.poppins(
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