import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../../core/constants/app_colors.dart';

/// Footer link row rendered under the submit button (e.g. "Don't have an
/// account? Sign Up").
class AuthLinkRow extends StatelessWidget {
  const AuthLinkRow({
    super.key,
    required this.prefix,
    required this.link,
    required this.onLinkPressed,
  });

  final String prefix;
  final String link;
  final VoidCallback onLinkPressed;

  @override
  Widget build(BuildContext context) {
    final TextStyle baseStyle = GoogleFonts.poppins(
      color: AppColors.textSecondary,
      fontSize: 14,
      fontWeight: FontWeight.w400,
    );

    return TextButton(
      onPressed: onLinkPressed,
      style: TextButton.styleFrom(
        padding: EdgeInsets.zero,
        alignment: Alignment.center,
        splashFactory: NoSplash.splashFactory,
      ),
      child: Text.rich(
        TextSpan(
          text: prefix,
          style: baseStyle,
          children: <InlineSpan>[
            TextSpan(
              text: link,
              style: GoogleFonts.poppins(
                color: AppColors.link,
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}