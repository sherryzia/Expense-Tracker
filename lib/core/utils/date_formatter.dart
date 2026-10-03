/// Consistent date formatting app-wide.
abstract final class DateFormatter {
  static String _pad(int value) => value.toString().padLeft(2, '0');

  /// `2026-09-21`
  static String iso(DateTime date) =>
      '${date.year}-${_pad(date.month)}-${_pad(date.day)}';
}