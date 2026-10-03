import '../constants/app_strings.dart';
import '../extensions/string_extensions.dart';

/// Field validators returned for form widgets.
abstract final class Validators {
  static final RegExp _emailPattern =
      RegExp(r'^[\w\.\-]+@([\w\-]+\.)+[A-Za-z]{2,4}$');

  static String? email(String? value) {
    if (value == null || value.isBlank) return AppStrings.emailRequired;
    if (!_emailPattern.hasMatch(value.trim())) {
      return AppStrings.emailInvalid;
    }
    return null;
  }
}