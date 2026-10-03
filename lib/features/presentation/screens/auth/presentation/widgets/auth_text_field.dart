import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../../core/constants/app_colors.dart';

/// Filled, pill-shaped input field used across the auth screens.
///
/// Password fields render masked dots and a visibility toggle.
class AuthTextField extends StatefulWidget {
  const AuthTextField({
    super.key,
    required this.label,
    this.hint = '',
    this.isPassword = false,
    this.hiddenInitially = false,
    this.keyboardType,
    this.textInputAction = TextInputAction.next,
  });

  final String label;
  final String hint;
  final bool isPassword;
  final bool hiddenInitially;
  final TextInputType? keyboardType;
  final TextInputAction textInputAction;

  @override
  State<AuthTextField> createState() => _AuthTextFieldState();
}

class _AuthTextFieldState extends State<AuthTextField> {
  late bool _obscured = widget.hiddenInitially;

  static const OutlineInputBorder _border = OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(30)),
    borderSide: BorderSide.none,
  );

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            widget.label,
            style: GoogleFonts.poppins(
              color: AppColors.textPrimary,
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        const SizedBox(height: 8),
        TextField(
          obscureText: _obscured,
          keyboardType: widget.keyboardType,
          textInputAction: widget.textInputAction,
          style: GoogleFonts.poppins(
            color: AppColors.textPrimary,
            fontSize: 14,
          ),
          decoration: InputDecoration(
            hintText: widget.hint.isEmpty ? null : widget.hint,
            hintStyle: GoogleFonts.poppins(
              color: AppColors.textSecondary,
              fontSize: 14,
            ),
            filled: true,
            fillColor: AppColors.inputFill,
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 24,
              vertical: 18,
            ),
            border: _border,
            enabledBorder: _border,
            focusedBorder: _border,
            suffixIcon: widget.isPassword
                ? IconButton(
                    icon: Icon(
                      _obscured ? Icons.visibility_off : Icons.visibility,
                      color: AppColors.textSecondary,
                    ),
                    onPressed: () => setState(() => _obscured = !_obscured),
                  )
                : null,
          ),
        ),
      ],
    );
  }
}