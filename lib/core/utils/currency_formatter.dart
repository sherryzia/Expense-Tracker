/// Consistent money formatting app-wide.
abstract final class CurrencyFormatter {
  /// Formats [amount] with thousands separators and [decimals] places.
  ///
  /// Example: `format(1234.5)` -> `$1,234.50`
  static String format(
    double amount, {
    String symbol = r'$',
    int decimals = 2,
  }) {
    String fixed = amount.toStringAsFixed(decimals);
    int dotIndex = fixed.indexOf('.');
    String whole = dotIndex == -1 ? fixed : fixed.substring(0, dotIndex);
    String fraction = dotIndex == -1 ? '' : fixed.substring(dotIndex);

    String grouped = whole.replaceAllMapped(
      RegExp(r'(\d)(?=(\d{3})+(?!\d))'),
      (Match match) => '${match[1]},',
    );
    return '$symbol$grouped$fraction';
  }

  /// Formats [amount] with an explicit sign for income/expense labels.
  ///
  /// Example: `signed(25)` -> `+$25.00`, `signed(-25)` -> `-$25.00`
  static String signed(
    double amount, {
    String symbol = r'$',
    int decimals = 2,
  }) {
    String sign = amount < 0 ? '-' : '+';
    return '$sign${format(amount.abs(), symbol: symbol, decimals: decimals)}';
  }
}