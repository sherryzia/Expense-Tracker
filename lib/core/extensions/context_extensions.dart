import 'package:flutter/material.dart';

import '../constants/app_constants.dart';

/// Typed shortcuts over [BuildContext].
extension BuildContextX on BuildContext {
  ThemeData get theme => Theme.of(this);

  ColorScheme get colorScheme => Theme.of(this).colorScheme;

  TextTheme get textTheme => Theme.of(this).textTheme;

  bool get isDark => Theme.of(this).brightness == Brightness.dark;

  EdgeInsets get screenPadding => MediaQuery.paddingOf(this);

  double get width => MediaQuery.sizeOf(this).width;

  double get height => MediaQuery.sizeOf(this).height;

  Future<void> showAppSnackBar(
    String message, {
    bool isError = false,
  }) async {
    final ScaffoldMessengerState messenger = ScaffoldMessenger.of(this);
    messenger
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          content: Text(message),
          backgroundColor: isError ? colorScheme.error : null,
          behavior: SnackBarBehavior.floating,
          margin: const EdgeInsets.all(AppConstants.layoutPadding),
        ),
      );
  }
}