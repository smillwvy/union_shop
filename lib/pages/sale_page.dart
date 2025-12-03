import 'package:flutter/material.dart';
import 'package:union_shop/layout/page_layout.dart';

const List<Map<String, String>> _saleProducts = [
  {
    'name': 'Classic Sweatshirt - Neutral',
    'oldPrice': '£18.99',
    'newPrice': '£14.99',
    'image': 'assets/images/classic_neutral_sweatshirt.png',
  },
  {
    'name': 'Recycled Notebook',
    'oldPrice': '£5.99',
    'newPrice': '£3.99',
    'image': 'assets/images/notebook.png',
  },
  {
    'name': 'Backpack - Black',
    'oldPrice': '£25.99',
    'newPrice': '£20.99',
    'image': 'assets/images/backpack.png',
  },
  {
    'name': 'Ladies Athletic Leggings',
    'oldPrice': '£19.99',
    'newPrice': '£14.99',
    'image': 'assets/images/leggings.png',
  },
];

class SalePage extends StatelessWidget {
  const SalePage({super.key});

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
                color: Colors.grey.shade100,
                padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 24),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Sale Items — Up to 20% OFF!',
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Grab discounted favourites while stocks last. Limited quantities available.',
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
                child: LayoutBuilder(
                  builder: (context, innerConstraints) {
                    final width = innerConstraints.maxWidth;
                    final crossAxisCount = width >= 1000
                        ? 3
                        : width >= 700
                            ? 3
                            : 2;
                    final childAspect = width >= 1000
                        ? 0.8
                        : width >= 700
                            ? 0.85
                            : 0.7;

                    return GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: crossAxisCount,
                        crossAxisSpacing: 16,
                        mainAxisSpacing: 16,
                        childAspectRatio: childAspect,
                      ),
                      itemCount: _saleProducts.length,
                      itemBuilder: (context, index) {
                        final product = _saleProducts[index];
                        return _SaleProductCard(product: product);
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _SaleProductCard extends StatelessWidget {
  final Map<String, String> product;

  const _SaleProductCard({required this.product});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, '/product'),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: AspectRatio(
                aspectRatio: 1,
                child: Image.asset(
                  product['image'] ?? '',
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      color: Colors.grey[200],
                      child: const Center(
                        child: Icon(
                          Icons.image_not_supported,
                          color: Colors.grey,
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product['name'] ?? '',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: Colors.grey[900],
                    height: 1.3,
                  ),
                ),
                const SizedBox(height: 6),
                Row(
                  children: [
                    Text(
                      product['oldPrice'] ?? '',
                      style: TextStyle(
                        decoration: TextDecoration.lineThrough,
                        color: Colors.grey[500],
                        fontSize: 13,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      product['newPrice'] ?? '',
                      style: const TextStyle(
                        color: Color(0xFF4d2963),
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Text(
                  'Limited time offer',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey[600],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
