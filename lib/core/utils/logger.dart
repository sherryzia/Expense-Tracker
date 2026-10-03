import 'package:flutter/foundation.dart';

import '../configs/app_config.dart';
import '../enums/app_environment.dart';

/// Lightweight logger; swap internals for sentry/datadog later.
abstract final class AppLogger {
  static bool get _enabled =>
      kDebugMode || AppConfig.environment != AppEnvironment.production;

  static void d(String tag, String message) {
    if (_enabled) debugPrint('[DEBUG][$tag] $message');
  }

  static void i(String tag, String message) {
    if (_enabled) debugPrint('[INFO][$tag] $message');
  }

  static void e(String tag, String message) {
    debugPrint('[ERROR][$tag] $message');
  }
}