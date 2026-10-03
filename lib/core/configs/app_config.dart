import '../enums/app_environment.dart';

/// Global app configuration.
///
/// Values are centralized here (optionally overridable via
/// `--dart-define`) so no configuration is scattered across the codebase.
abstract final class AppConfig {
  static const AppEnvironment environment = AppEnvironment.development;

  static String get apiBaseUrl => switch (environment) {
        AppEnvironment.development => 'https://api.dev.example.com',
        AppEnvironment.staging => 'https://api.staging.example.com',
        AppEnvironment.production => 'https://api.example.com',
      };

  static const Duration networkTimeout = Duration(seconds: 15);
}