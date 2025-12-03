import 'package:flutter/material.dart';
import 'package:union_shop/layout/page_layout.dart';

class CollectionPage extends StatelessWidget {
  const CollectionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const PageLayout(
      child: Center(
        child: Text(
          'Clothing collection page (placeholder)',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
