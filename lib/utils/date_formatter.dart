/// Consistent date formatting for transaction tiles.
class DateFormatter {
  DateFormatter._();

  static const List<String> _months = [
    'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
    'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec',
  ];

  /// Formats as `04 Jun 2026`.
  static String formatTransactionDate(DateTime date) {
    final day = date.day.toString().padLeft(2, '0');
    final month = _months[date.month - 1];
    return '$day $month ${date.year}';
  }
}
