import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../../core/constants/app_colors.dart';
import '../../../../../../core/constants/app_strings.dart';
import '../../../../../../core/extensions/context_extensions.dart';

/// Mint-header app bar: white back arrow, centered bold title and a white
/// circular notification bell.
class MintAppBarRow extends StatelessWidget {
  const MintAppBarRow({super.key, required this.title, this.onBellPressed});

  final String title;
  final VoidCallback? onBellPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 44,
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Positioned(
            left: 0,
            child: IconButton(
              onPressed: () => Navigator.of(context).pop(),
              icon: const Icon(
                Icons.arrow_back,
                color: AppColors.white,
                size: 22,
              ),
            ),
          ),
          Text(
            title,
            style: GoogleFonts.poppins(
              color: AppColors.darkGreen,
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
          Positioned(
            right: 0,
            child: DecoratedBox(
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.white,
              ),
              child: IconButton(
                onPressed: onBellPressed ??
                    () =>
                        context.showAppSnackBar(AppStrings.authPlaceholder),
                icon: const Icon(
                  Icons.notifications_none_rounded,
                  color: AppColors.darkGreen,
                ),
                constraints:
                    const BoxConstraints.tightFor(width: 40, height: 40),
                padding: EdgeInsets.zero,
              ),
            ),
          ),
        ],
      ),
    );
  }
}