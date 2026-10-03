import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../../core/constants/app_colors.dart';
import '../../../../../../core/constants/app_strings.dart';
import '../../../../../../core/extensions/context_extensions.dart';
import 'social_circle.dart';

/// "or sign up with" divider followed by circular social icon buttons.
class AuthSocialRow extends StatelessWidget {
  const AuthSocialRow({super.key, this.onSocialPressed});

  /// Invoked when a social icon is tapped; defaults to a placeholder message.
  final VoidCallback? onSocialPressed;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Expanded(child: Divider(color: AppColors.border)),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                AppStrings.loginOrSignUpWith,
                style: GoogleFonts.poppins(
                  color: AppColors.textSecondary,
                  fontSize: 13,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            const Expanded(child: Divider(color: AppColors.border)),
          ],
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SocialCircle(
              label: 'f',
              onPressed: onSocialPressed ??
                  () => context.showAppSnackBar(AppStrings.authPlaceholder),
            ),
            const SizedBox(width: 24),
            SocialCircle(
              label: 'G',
              onPressed: onSocialPressed ??
                  () => context.showAppSnackBar(AppStrings.authPlaceholder),
            ),
          ],
        ),
      ],
    );
  }
}