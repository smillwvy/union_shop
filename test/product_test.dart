import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:union_shop/main.dart';

void main() {
  group('Product Page Tests', () {
    testWidgets('should display product page with selected item', (tester) async {
      await tester.pumpWidget(const UnionShopApp());
      await tester.pumpAndSettle();

      // Navigate directly to the product route defined in main.dart.
      final navigator = tester.state<NavigatorState>(find.byType(Navigator));
      navigator.pushNamed('/product');
      await tester.pumpAndSettle();

      expect(find.text('Limited Edition Essential Zip Hoodies'), findsOneWidget);
      expect(find.text('£14.99'), findsNWidgets(2)); // old and new price labels
      expect(find.text('Tax included.'), findsOneWidget);
      expect(find.text('ADD TO CART'), findsOneWidget);
    });

    testWidgets('should display footer on product page', (tester) async {
      await tester.pumpWidget(const UnionShopApp());
      await tester.pumpAndSettle();

      final navigator = tester.state<NavigatorState>(find.byType(Navigator));
      navigator.pushNamed('/product');
      await tester.pumpAndSettle();

      // Scroll to footer text.
      await tester.scrollUntilVisible(
        find.text('Opening Hours'),
        500,
        scrollable: find.byType(Scrollable).first,
      );
      await tester.pumpAndSettle();

      expect(find.text('Opening Hours'), findsOneWidget);
      expect(find.text('Help & Information'), findsOneWidget);
    });

    testWidgets('should allow quantity increment on product page', (tester) async {
      await tester.pumpWidget(const UnionShopApp());
      await tester.pumpAndSettle();

      final navigator = tester.state<NavigatorState>(find.byType(Navigator));
      navigator.pushNamed('/product');
      await tester.pumpAndSettle();

      // Scroll to quantity selector if needed, then tap + to increase.
      await tester.scrollUntilVisible(
        find.byIcon(Icons.add),
        300,
        scrollable: find.byType(Scrollable).first,
      );
      await tester.pumpAndSettle();

      await tester.tap(find.byIcon(Icons.add));
      await tester.pumpAndSettle();

      expect(find.text('2'), findsWidgets);
    });
  });
}
