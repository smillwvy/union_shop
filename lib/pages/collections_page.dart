import 'package:flutter/material.dart';
import 'package:union_shop/layout/page_layout.dart';
import 'package:union_shop/widgets/product_card.dart';

const List<Map<String, String>> _products = [
  // Static product data for the grid.
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
    'title': 'Classic Hoodie',
    'price': '£24.99',
    'imageUrl': 'assets/images/classic_hoodie.png',
  },
  {
    'title': 'Classic Sweatshirt',
    'price': '£21.99',
    'imageUrl': 'assets/images/classic_sweatshirt.png',
  },
];

class CollectionsPage extends StatefulWidget {
  const CollectionsPage({super.key});

  @override
  State<CollectionsPage> createState() => _CollectionsPageState();
}

class _CollectionsPageState extends State<CollectionsPage> {
  // Track current filter and sort selection (UI only for now).
  String _selectedFilter = 'All products';
  String _selectedSort = 'Featured';

  @override
  Widget build(BuildContext context) {
    return PageLayout(
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewPadding.bottom + 100,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 24),
                color: Colors.grey.shade100,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // Page title and subtitle.
                    const Text(
                      'Winter Favourites',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'Shop all of this season\'s must haves in one place.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.black54,
                      ),
                    ),
                    const SizedBox(height: 16),
                    // Filters and sort controls.
                    _buildFilterSortBar(),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16),
                child: LayoutBuilder(builder: (context, innerConstraints) {
                  final width = innerConstraints.maxWidth;
                  // Choose grid layout based on available width.
                  final crossAxisCount = width >= 1000
                      ? 3
                      : width >= 700
                          ? 3
                          : width >= 500
                              ? 2
                              : 1;
                  final childAspect = width >= 1000 ? 0.8 : 0.9;

                  // Product grid layout:
                  // - shrinkWrap: true => take only needed height.
                  // - NeverScrollableScrollPhysics => parent handles scrolling.
                  // - crossAxisCount / spacing / aspect ratio => grid layout.
                  // - itemBuilder => loop over _products and build ProductCard.
                  return GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: crossAxisCount,
                      crossAxisSpacing: 16,
                      mainAxisSpacing: 16,
                      childAspectRatio: childAspect,
                    ),
                    itemCount: _products.length,
                    itemBuilder: (context, index) {
                      final product = _products[index];
                      // Pull fields with simple fallback strings (no ??: syntax).
                      final title = product['title'] != null
                          ? product['title']!
                          : 'Product';
                      final price =
                          product['price'] != null ? product['price']! : '£0.00';
                      final imageUrl = product['imageUrl'] != null
                          ? product['imageUrl']!
                          : '';
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: ProductCard(
                          title: title,
                          price: price,
                          imageUrl: imageUrl,
                        ),
                      );
                    },
                  );
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFilterSortBar() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 4),
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(color: Colors.grey.shade400, width: 1),
          bottom: BorderSide(color: Colors.grey.shade400, width: 1),
        ),
      ),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            // Filter dropdown.
            _buildDropdownSection(
              label: 'FILTER BY',
              value: _selectedFilter,
              options: const ['All products', 'Hoodies', 'T-Shirts'],
              onChanged: (value) {
                if (value == null) return;
                setState(() {
                  _selectedFilter = value;
                });
              },
            ),
            const SizedBox(width: 12),
            // Sort dropdown.
            _buildDropdownSection(
              label: 'SORT BY',
              value: _selectedSort,
              options: const ['Featured', 'Price: low to high', 'Price: high to low'],
              onChanged: (value) {
                if (value == null) return;
                setState(() {
                  _selectedSort = value;
                });
              },
            ),
            const SizedBox(width: 12),
            // Static count label.
            Text(
              '6 products',
              style: TextStyle(
                fontSize: 13,
                color: Colors.grey[800],
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDropdownSection({
    required String label,
    required String value,
    required List<String> options,
    required ValueChanged<String?> onChanged,
  }) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w700,
            letterSpacing: 0.5,
          ),
        ),
        const SizedBox(width: 8),
        SizedBox(
          width: 170,
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              isExpanded: true,
              value: value,
              items: options
                  .map(
                    (option) => DropdownMenuItem(
                      value: option,
                      child: Text(option),
                    ),
                  )
                  .toList(),
              onChanged: onChanged,
            ),
          ),
        ),
      ],
    );
  }
}
