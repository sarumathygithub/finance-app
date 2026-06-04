import 'package:flutter_test/flutter_test.dart';
import 'package:finance_app/data/mock_data.dart';
import 'package:finance_app/main.dart';
import 'package:finance_app/utils/currency_formatter.dart';

void main() {
  testWidgets('Finance app loads spend summary screen', (WidgetTester tester) async {
    await tester.pumpWidget(const FinanceApp());
    await tester.pump();
    await tester.pump(const Duration(seconds: 2));

    expect(find.text('Hello, Sarumathy 👋'), findsOneWidget);
    expect(find.text('Monthly Spend'), findsOneWidget);
    expect(find.text(CurrencyFormatter.format(MockData.monthlySpend)),
        findsOneWidget);
    expect(find.text('Categories'), findsOneWidget);
    expect(find.text('Recent Transactions'), findsOneWidget);
    expect(find.text('Swiggy'), findsOneWidget);
    expect(
      find.text(CurrencyFormatter.formatExpense(450)),
      findsOneWidget,
    );
  });

  test('mock data contains exactly 7 transactions', () {
    expect(MockData.recentTransactions.length,
        MockData.recentTransactionCount);
  });
}
