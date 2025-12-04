import 'package:flutter/material.dart';
import 'package:union_shop/layout/page_layout.dart';
import 'package:union_shop/models/cart.dart';
import 'package:union_shop/widgets/labeled_dropdown.dart';
import 'package:union_shop/widgets/quantity_selector.dart';

class ProductPage extends StatelessWidget {
  final String title;
  final String price;
  final String? originalPrice;
  final String imageUrl;

  // This page accepts title/price/image from the caller so it can show any product.
  const ProductPage({
    super.key,
    required this.title,
    required this.price,
    this.originalPrice,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    // Delegate to a stateful widget to handle dropdowns and quantity.
    return _ProductPageContent(
      title: title,
      price: price,
      originalPrice: originalPrice,
      imageUrl: imageUrl,
    );
  }
}

class _ProductPageContent extends StatefulWidget {
  final String title;
  final String price;
  final String? originalPrice;
  final String imageUrl;

  const _ProductPageContent({
    required this.title,
    required this.price,
    required this.originalPrice,
    required this.imageUrl,
  });

  @override
  State<_ProductPageContent> createState() => _ProductPageContentState();
}

class _ProductPageContentState extends State<_ProductPageContent> {
  final List<String> _colors = ['Baby Pink', 'Grey', 'Purple', 'Blue'];
  final List<String> _sizes = ['S', 'M', 'L'];

  // Current selections.
  String _selectedColor = 'Baby Pink';
  String _selectedSize = 'M';
  int _quantity = 1;

  // Convert a price string like "£14.99" into a double.
  double _parsePrice(String price) {
    // Trim spaces first.
    var cleaned = price.trim();
    // Drop the pound symbol if present.
    if (cleaned.startsWith('£')) {
      cleaned = cleaned.substring(1);
    }
    // Parse to number; fall back to 0.0 if invalid.
    return double.tryParse(cleaned) ?? 0.0;
  }

  @override
  Widget build(BuildContext context) {
    return PageLayout(
      child: SingleChildScrollView(
        child: Container(
          color: Colors.white,
          padding: const EdgeInsets.all(24),
          child: LayoutBuilder(
            builder: (context, constraints) {
              // If wide screen, show image and details side by side.
              final bool isWide = constraints.maxWidth > 800;
              // Image block.
              final Widget imageSection = AspectRatio(
                aspectRatio: 1,
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.grey[200],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.asset(
                      widget.imageUrl,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              );

              // Details block: title, price, options, quantity, add to cart, description.
              final Widget detailsSection = Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.title,
                    style: const TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      if (widget.originalPrice != null &&
                          widget.originalPrice != widget.price) ...[
                        Text(
                          widget.originalPrice!,
                          style: const TextStyle(
                            fontSize: 18,
                            color: Colors.grey,
                            decoration: TextDecoration.lineThrough,
                          ),
                        ),
                        const SizedBox(width: 12),
                        Text(
                          widget.price,
                          style: const TextStyle(
                            fontSize: 26,
                            fontWeight: FontWeight.w700,
                            color: Color(0xFF4d2963),
                          ),
                        ),
                      ] else
                        Text(
                          widget.price,
                          style: const TextStyle(
                            fontSize: 26,
                            fontWeight: FontWeight.w700,
                            color: Color(0xFF4d2963),
                          ),
                        ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Tax included.',
                    style: TextStyle(
                      fontSize: 13,
                      color: Colors.grey[700],
                    ),
                  ),
                  const SizedBox(height: 24),
                  LabeledDropdown(
                    label: 'Color',
                    value: _selectedColor,
                    items: _colors,
                    onChanged: (value) {
                      if (value != null) {
                        setState(() {
                          _selectedColor = value;
                        });
                      }
                    },
                  ),
                  const SizedBox(height: 16),
                  LabeledDropdown(
                    label: 'Size',
                    value: _selectedSize,
                    items: _sizes,
                    onChanged: (value) {
                      if (value != null) {
                        setState(() {
                          _selectedSize = value;
                        });
                      }
                    },
                  ),
                  const SizedBox(height: 16),
                  QuantitySelector(
                    quantity: _quantity,
                    onDecrement: () {
                      setState(() {
                        _quantity = _quantity > 1 ? _quantity - 1 : 1;
                      });
                    },
                    onIncrement: () {
                      setState(() {
                        _quantity += 1;
                      });
                    },
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        addItem(
                          id: widget.title,
                          title: widget.title,
                          price: _parsePrice(widget.price),
                          imageUrl: widget.imageUrl,
                          quantity: _quantity,
                        );
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Added to cart'),
                            duration: Duration(seconds: 1),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 14),
                      ),
                      child: const Text(
                        'ADD TO CART',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                  Text(
                    'A comfortable zip hoodie perfect for layering across seasons. Premium cotton blend, soft interior, and a relaxed fit for everyday wear.',
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.grey[800],
                      height: 1.5,
                    ),
                  ),
                ],
              );

              if (isWide) {
                return Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(child: imageSection),
                    const SizedBox(width: 32),
                    Expanded(child: detailsSection),
                  ],
                );
              }

              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  imageSection,
                  const SizedBox(height: 24),
                  detailsSection,
                ],
              );
            },
          ),
        ),
      ),
    );
  }

}
