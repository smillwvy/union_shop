import 'package:flutter/material.dart';
import 'package:union_shop/layout/page_layout.dart';
import 'package:union_shop/widgets/product_card.dart';

const List<Map<String, String>> _products = [
  {
    'title': 'Limited Edition Essential Zip Hoodie',
    'price': '£14.99',
    'imageUrl': 'assets/images/essential_hoodie.png',
  },
  {
    'title': 'Essential T-Shirt',
    'price': '£16.99',
    'imageUrl': 'assets/images/essential_tshirt.png',
  },
  {
    'title': 'Signature Hoodie',
    'price': '£32.99',
    'imageUrl': 'assets/images/signature_hoodie.png',
  },
  {
    'title': 'Signature T-Shirt',
    'price': '£14.99',
    'imageUrl': 'assets/images/signature_tshirt.png',
  },
  {
    'title': 'Essential Hoodie (Alt)',
    'price': '£15.99',
    'imageUrl': 'assets/images/essential_hoodie.png',
  },
  {
    'title': 'Signature Tee (Alt)',
    'price': '£13.99',
    'imageUrl': 'assets/images/signature_tshirt.png',
  },
];

class CollectionsPage extends StatelessWidget {
  const CollectionsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return PageLayout(
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewPadding.bottom + 100),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 24),
                color: Colors.grey.shade100,
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Collections',
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Browse our curated categories and find your next favourite piece.',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.black54,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16),
                child: LayoutBuilder(builder: (context, innerConstraints) {
                  final width = innerConstraints.maxWidth;
                  final crossAxisCount = width >= 1000
                      ? 3
                      : width >= 700
                          ? 3
                          : width >= 500
                              ? 2
                              : 1;
                  final childAspect = width >= 1000 ? 0.8 : 0.9;

                  return GridView.count(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    crossAxisCount: crossAxisCount,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                    childAspectRatio: childAspect,
                    children: _products
                        .map((p) => Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 8),
                              child: ProductCard(
                                title: p['title'] ?? '',
                                price: p['price'] ?? '',
                                imageUrl: p['imageUrl'] ?? '',
                              ),
                            ))
                        .toList(),
                  );
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
