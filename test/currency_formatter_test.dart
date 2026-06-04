import 'package:flutter_test/flutter_test.dart';
import 'package:finance_app/utils/currency_formatter.dart';

void main() {
  group('CurrencyFormatter', () {
    test('formats amounts with rupee symbol before digits', () {
      expect(CurrencyFormatter.format(24500), '₹24,500');
      expect(CurrencyFormatter.format(8400), '₹8,400');
      expect(CurrencyFormatter.format(5200), '₹5,200');
      expect(CurrencyFormatter.format(6100), '₹6,100');
      expect(CurrencyFormatter.format(450), '₹450');
    });

    test('formats expenses with leading minus', () {
      expect(CurrencyFormatter.formatExpense(450), '-₹450');
      expect(CurrencyFormatter.formatExpense(2899), '-₹2,899');
    });
  });
}
