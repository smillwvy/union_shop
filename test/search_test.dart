import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:union_shop/main.dart';

void main() {
  group('Search Page Tests', () {
    testWidgets('should show prompt when query is empty', (tester) async {
      await tester.pumpWidget(const UnionShopApp());
      await tester.pumpAndSettle();

      final navigator = tester.state<NavigatorState>(find.byType(Navigator));
      navigator.pushNamed('/search');
      await tester.pumpAndSettle();

      expect(find.text('Search our Products'), findsOneWidget);
      expect(find.text('Type something to search'), findsOneWidget);
    });

    testWidgets('should show results when searching', (tester) async {
      await tester.pumpWidget(const UnionShopApp());
      await tester.pumpAndSettle();

      final navigator = tester.state<NavigatorState>(find.byType(Navigator));
      navigator.pushNamed('/search');
      await tester.pumpAndSettle();

      // Target the search input (hint: 'Search') to avoid hitting footer email field.
      final searchField = find.byWidgetPredicate(
        (widget) => widget is TextField && widget.decoration?.hintText == 'Search',
      );
      await tester.enterText(searchField, 'Hoodie');
      await tester.tap(find.text('SUBMIT'));
      await tester.pumpAndSettle();

      expect(find.text('Limited Edition Essential Zip Hoodies'), findsOneWidget);
      expect(find.text('Signature Hoodie'), findsOneWidget);
    });

    testWidgets('should show no results message when nothing matches', (tester) async {
      await tester.pumpWidget(const UnionShopApp());
      await tester.pumpAndSettle();

      final navigator = tester.state<NavigatorState>(find.byType(Navigator));
      navigator.pushNamed('/search');
      await tester.pumpAndSettle();

      final searchField = find.byWidgetPredicate(
        (widget) => widget is TextField && widget.decoration?.hintText == 'Search',
      );
      await tester.enterText(searchField, 'xyz');
      await tester.tap(find.text('SUBMIT'));
      await tester.pumpAndSettle();

      expect(find.text('No results found for "xyz"'), findsOneWidget);
    });
  });
}
