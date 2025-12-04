import 'package:flutter/material.dart';
import 'package:union_shop/layout/page_layout.dart';
import 'package:union_shop/widgets/product_card.dart';

const List<Map<String, String>> _allProducts = [
  {
    'title': 'Limited Edition Essential Zip Hoodies',
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
    'title': 'Classic Sweatshirt - Neutral',
    'price': '£14.99',
    'imageUrl': 'assets/images/classic_neutral_sweatshirt.png',
  },
  {
    'title': 'Recycled Notebook',
    'price': '£3.99',
    'imageUrl': 'assets/images/notebook.png',
  },
  {
    'title': 'Backpack - Black',
    'price': '£20.99',
    'imageUrl': 'assets/images/backpack.png',
  },
  {
    'title': 'Ladies Athletic Leggings',
    'price': '£14.99',
    'imageUrl': 'assets/images/leggings.png',
  },
];

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final TextEditingController _controller = TextEditingController();
  String _query = '';

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _handleSubmit() {
    setState(() {
      _query = _controller.text.trim();
    });
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return PageLayout(
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(
            left: 16,
            right: 16,
            top: 24,
            bottom: MediaQuery.of(context).viewPadding.bottom + 100,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'SEARCH OUR SITE',
                textAlign: TextAlign.center,
                style: textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.w800,
                  letterSpacing: 1.4,
                ),
              ),
              const SizedBox(height: 20),
              Center(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 520),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      TextField(
                        controller: _controller,
                        onSubmitted: (_) => _handleSubmit(),
                        decoration: InputDecoration(
                          hintText: 'Search',
                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: 14,
                            vertical: 12,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(color: Color(0xFF4d2963)),
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      SizedBox(
                        height: 46,
                        child: ElevatedButton(
                          onPressed: _handleSubmit,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF4d2963),
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          child: const Text(
                            'SUBMIT',
                            style: TextStyle(
                              fontSize: 15,
                              letterSpacing: 1,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 24),
              LayoutBuilder(
                builder: (context, constraints) {
                  final hasQuery = _query.isNotEmpty;
                  final results = hasQuery
                      ? _allProducts.where((product) {
                          final title = product['title'] ?? '';
                          return title.toLowerCase().contains(_query.toLowerCase());
                        }).toList()
                      : const <Map<String, String>>[];

                  if (!hasQuery) {
                    return const _EmptyState(
                      message: 'Type something to search',
                    );
                  }

                  if (results.isEmpty) {
                    return _EmptyState(
                      message: 'No results found for "$_query"',
                    );
                  }

                  final width = constraints.maxWidth;
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
                    itemCount: results.length,
                    itemBuilder: (context, index) {
                      final product = results[index];
                      return ProductCard(
                        title: product['title'] ?? '',
                        price: product['price'] ?? '',
                        imageUrl: product['imageUrl'] ?? '',
                      );
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _EmptyState extends StatelessWidget {
  final String message;

  const _EmptyState({required this.message});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Center(
      child: Text(
        message,
        textAlign: TextAlign.center,
        style: textTheme.bodyMedium?.copyWith(
          fontSize: 16,
          color: Colors.grey[600],
          letterSpacing: 0.2,
        ),
      ),
    );
  }
}
