import 'package:flutter/material.dart';
import 'package:union_shop/layout/page_layout.dart';
import 'package:union_shop/models/cart.dart';
import 'package:union_shop/widgets/labeled_dropdown.dart';
import 'package:union_shop/widgets/quantity_selector.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({super.key});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  final List<String> _colors = ['Baby Pink', 'Grey', 'Purple', 'Blue'];
  final List<String> _sizes = ['S', 'M', 'L'];

  String _selectedColor = 'Baby Pink';
  String _selectedSize = 'M';
  int _quantity = 1;

  @override
  Widget build(BuildContext context) {
    return PageLayout(
      child: SingleChildScrollView(
        child: Container(
          color: Colors.white,
          padding: const EdgeInsets.all(24),
          child: LayoutBuilder(
            builder: (context, constraints) {
              final bool isWide = constraints.maxWidth > 800;
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
                      'assets/images/essential_hoodie.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              );

              final Widget detailsSection = Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Limited Edition Essential Zip Hoodies',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 12),
                  const Row(
                    children: [
                      Text(
                        '£20.00',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.grey,
                          decoration: TextDecoration.lineThrough,
                        ),
                      ),
                      SizedBox(width: 12),
                      Text(
                        '£14.99',
                        style: TextStyle(
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
                        addToCart(
                          id: 'hoodie-001',
                          title: 'Limited Edition Essential Zip Hoodie',
                          price: 14.99,
                          imageUrl: 'assets/images/essential_hoodie.png',
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
