import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:union_shop/pages/product_page.dart';

void main() {
  group('Product Page Tests', () {
    Widget createTestWidget() {
      return const MaterialApp(
        home: ProductPage(
          title: 'Test Product',
          price: '£12.34',
          imageUrl: 'assets/images/essential_hoodie.png',
        ),
      );
    }

    testWidgets('should display product page with basic elements', (
      tester,
    ) async {
      await tester.pumpWidget(createTestWidget());
      await tester.pump();

      // Check that basic UI elements are present
      expect(find.text('Test Product'), findsOneWidget);
      expect(find.text('£12.34'), findsNWidgets(2)); // crossed and sale price
      expect(find.text('Tax included.'), findsOneWidget);
      expect(find.text('ADD TO CART'), findsOneWidget);
    });

    testWidgets('should display footer', (tester) async {
      await tester.pumpWidget(createTestWidget());
      await tester.pump();

      // Check that footer is present
      expect(find.text('Opening Hours'), findsOneWidget);
      expect(find.text('Help & Information'), findsOneWidget);
    });
  });
}
