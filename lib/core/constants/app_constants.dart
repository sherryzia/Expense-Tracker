/// App-wide constants: layout sizes, durations and storage keys.
abstract final class AppConstants {
  // Layout
  static const double layoutPadding = 16;
  static const double layoutPaddingSmall = 8;
  static const double componentRadius = 12;
  static const double componentSpacing = 16;

  // Animation
  static const Duration pageTransition = Duration(milliseconds: 300);

  // Timing
  static const Duration splashDisplay = Duration(milliseconds: 2200);

  // Onboarding
  static const int onboardingPageCount = 3;
  static const double onboardingLogoWidth = 150;

  // Auth screens
  static const double authCardTopRadius = 40;
  static const int pinLength = 6;

  // Storage keys
  static const String themeKey = 'app_theme';
  static const String localeKey = 'app_locale';
}