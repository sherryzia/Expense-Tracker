import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../../core/constants/app_colors.dart';
import '../../../../../../core/constants/app_constants.dart';

/// Shared layout for auth screens: mint header + white rounded card.
///
/// The top ~one third is a solid primary header holding [title]; a white
/// card with large rounded top corners overlays it and hosts [children].
class AuthScaffold extends StatelessWidget {
  const AuthScaffold({
    super.key,
    required this.title,
    required this.children,
  });

  final String title;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.dark,
        child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            final double headerHeight = constraints.maxHeight * 0.32;

            return Stack(
              children: <Widget>[
                Positioned(
                  top: 0,
                  left: 0,
                  right: 0,
                  height: headerHeight,
                  child: Container(
                    color: AppColors.primary,
                    padding: EdgeInsets.only(
                      top: MediaQuery.paddingOf(context).top + 16,
                      left: 8,
                      right: 8,
                    ),
                    child: Stack(
                      children: <Widget>[
                        Center(
                          child: Text(
                            title,
                            style: GoogleFonts.poppins(
                              color: AppColors.darkGreen,
                              fontSize: 28,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                        if (Navigator.of(context).canPop())
                          Positioned(
                            left: 8,
                            top: 0,
                            bottom: 0,
                            child: Center(
                              child: IconButton(
                                onPressed: () =>
                                    Navigator.of(context).maybePop(),
                                style: IconButton.styleFrom(
                                  foregroundColor: AppColors.darkGreen,
                                ),
                                icon: const Icon(
                                  Icons.arrow_back_ios_new,
                                  size: 20,
                                ),
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  top: constraints.maxHeight * 0.24,
                  left: 0,
                  right: 0,
                  bottom: 0,
                  child: DecoratedBox(
                    decoration: const BoxDecoration(
                      color: AppColors.surface,
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(AppConstants.authCardTopRadius),
                      ),
                    ),
                    child: SafeArea(
                      top: false,
                      child: SingleChildScrollView(
                        padding: const EdgeInsets.fromLTRB(24, 32, 24, 24),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: children,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}