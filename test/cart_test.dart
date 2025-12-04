import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:union_shop/main.dart';

void main() {
  group('Cart Page Tests', () {
    testWidgets('should show empty cart message', (tester) async {
      await tester.pumpWidget(const UnionShopApp());
      await tester.pumpAndSettle();

      // Navigate to cart page via named route.
      final navigator = tester.state<NavigatorState>(find.byType(Navigator));
      navigator.pushNamed('/cart');
      await tester.pumpAndSettle();

      expect(find.text('Your Cart'), findsOneWidget);
      expect(find.text('Your cart is currently empty 🛒'), findsOneWidget);
      expect(find.text('Continue Shopping'), findsOneWidget);
    });

    testWidgets('continue shopping button should navigate home', (tester) async {
      await tester.pumpWidget(const UnionShopApp());
      await tester.pumpAndSettle();

      final navigator = tester.state<NavigatorState>(find.byType(Navigator));
      navigator.pushNamed('/cart');
      await tester.pumpAndSettle();

      await tester.tap(find.text('Continue Shopping'));
      await tester.pumpAndSettle();

      // After tapping, the home hero text should be visible.
      expect(
        find.text(
          'BIG SALE! OUR ESSENTIAL RANGE HAS DROPPED IN PRICE! OVER 20% OFF! COME GRAB YOURS WHILE STOCK LASTS!',
        ),
        findsOneWidget,
      );
    });

    testWidgets('cart page should show footer text', (tester) async {
      await tester.pumpWidget(const UnionShopApp());
      await tester.pumpAndSettle();

      final navigator = tester.state<NavigatorState>(find.byType(Navigator));
      navigator.pushNamed('/cart');
      await tester.pumpAndSettle();

      await tester.scrollUntilVisible(
        find.text('Opening Hours'),
        500,
        scrollable: find.byType(Scrollable).first,
      );
      await tester.pumpAndSettle();

      expect(find.text('Opening Hours'), findsOneWidget);
      expect(find.text('Help & Information'), findsOneWidget);
    });
  });
}
