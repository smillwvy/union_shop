import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:union_shop/main.dart';

void main() {
  group('Collections Page Tests', () {
    testWidgets('should display collections header and filters', (tester) async {
      await tester.pumpWidget(const UnionShopApp());
      await tester.pumpAndSettle();

      // Navigate to collections page via named route.
      final navigator = tester.state<NavigatorState>(find.byType(Navigator));
      navigator.pushNamed('/collections');
      await tester.pumpAndSettle();

      expect(find.text('Winter Favourites'), findsOneWidget);
      expect(
        find.text('Shop all of this season\'s must haves in one place.'),
        findsOneWidget,
      );
      expect(find.text('FILTER BY'), findsOneWidget);
      expect(find.text('SORT BY'), findsOneWidget);
      expect(find.text('6 products'), findsOneWidget);
    });

    testWidgets('should display collection product cards', (tester) async {
      await tester.pumpWidget(const UnionShopApp());
      await tester.pumpAndSettle();

      final navigator = tester.state<NavigatorState>(find.byType(Navigator));
      navigator.pushNamed('/collections');
      await tester.pumpAndSettle();

      // Ensure at least the first products are visible.
      expect(find.text('Limited Edition Essential Zip Hoodie'), findsOneWidget);
      expect(find.text('Essential T-Shirt'), findsOneWidget);

      // Scroll to reach items further down the list.
      await tester.scrollUntilVisible(
        find.text('Classic Sweatshirt'),
        500,
        scrollable: find.byType(Scrollable).first,
      );
      await tester.pumpAndSettle();

      expect(find.text('Classic Hoodie'), findsOneWidget);
      expect(find.text('Classic Sweatshirt'), findsOneWidget);
    });

    testWidgets('should keep footer visible after scroll', (tester) async {
      await tester.pumpWidget(const UnionShopApp());
      await tester.pumpAndSettle();

      final navigator = tester.state<NavigatorState>(find.byType(Navigator));
      navigator.pushNamed('/collections');
      await tester.pumpAndSettle();

      // Scroll to footer text.
      await tester.scrollUntilVisible(
        find.text('Opening Hours'),
        600,
        scrollable: find.byType(Scrollable).first,
      );
      await tester.pumpAndSettle();

      expect(find.text('Opening Hours'), findsOneWidget);
      expect(find.text('Help & Information'), findsOneWidget);
    });
  });
}
