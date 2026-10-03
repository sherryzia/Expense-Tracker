/// String helpers used across the app.
extension StringX on String {
  bool get isBlank => trim().isEmpty;

  String get capitalized =>
      isBlank ? this : '${this[0].toUpperCase()}${substring(1)}';
}