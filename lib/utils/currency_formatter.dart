/// Indian currency formatting — rupee symbol always precedes the amount.
class CurrencyFormatter {
  CurrencyFormatter._();

  static const String symbol = '₹';

  /// Formats [amount] as Indian currency, e.g. ₹24,500, ₹8,400, ₹450.
  static String format(num amount) {
    final value = amount.round();
    final digits = _groupDigits(value.abs());
    final prefix = value < 0 ? '-$symbol' : symbol;
    return '$prefix$digits';
  }

  /// Formats an expense with a leading minus, e.g. -₹450, -₹2,899.
  static String formatExpense(num amount) {
    final value = amount.round();
    if (value == 0) return format(0);
    return '-${format(value)}';
  }

  /// Indian numbering: last 3 digits, then groups of 2 (e.g. 12,34,567).
  static String _groupDigits(int value) {
    final s = value.toString();
    if (s.length <= 3) return s;

    final lastThree = s.substring(s.length - 3);
    var rest = s.substring(0, s.length - 3);
    final groups = <String>[];

    while (rest.length > 2) {
      groups.insert(0, rest.substring(rest.length - 2));
      rest = rest.substring(0, rest.length - 2);
    }
    if (rest.isNotEmpty) {
      groups.insert(0, rest);
    }

    return '${groups.join(',')},$lastThree';
  }
}
