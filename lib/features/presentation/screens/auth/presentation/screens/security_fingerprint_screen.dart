import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../../core/constants/app_colors.dart';
import '../../../../../../core/constants/app_routes.dart';
import '../../../../../../core/constants/app_strings.dart';
import '../widgets/auth_scaffold.dart';
import '../widgets/auth_submit_button.dart';

/// Security Fingerprint screen — enables biometic access.
class SecurityFingerprintScreen extends StatelessWidget {
  const SecurityFingerprintScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AuthScaffold(
      title: AppStrings.fingerprintTitle,
      children: <Widget>[
        const SizedBox(height: 8),
        Center(
          child: Container(
            width: 160,
            height: 160,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.inputFill,
            ),
            child: const Icon(
              Icons.fingerprint,
              color: AppColors.primary,
              size: 80,
            ),
          ),
        ),
        const SizedBox(height: 28),
        Text(
          AppStrings.fingerprintUseFingerprint,
          textAlign: TextAlign.center,
          style: GoogleFonts.poppins(
            color: AppColors.textPrimary,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 12),
        Text(
          AppStrings.fingerprintDescription,
          textAlign: TextAlign.center,
          style: GoogleFonts.leagueSpartan(
            color: AppColors.subtext,
            fontSize: 14,
            fontWeight: FontWeight.w400,
            height: 1.5,
          ),
        ),
        const SizedBox(height: 36),
        AuthSubmitButton(
          label: AppStrings.fingerprintUseTouchId,
          variant: AuthSubmitVariant.quiet,
          onPressed: () => Navigator.of(context).pushNamedAndRemoveUntil(
            AppRoutes.home,
            (Route<dynamic> route) => false,
          ),
        ),
        const SizedBox(height: 12),
        TextButton(
          onPressed: () =>
              Navigator.of(context).pushNamed(AppRoutes.securityPin),
          child: Text(
            AppStrings.fingerprintStandardCodes,
            style: GoogleFonts.poppins(
              color: AppColors.inkGreen,
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }
}