import 'package:flutter/material.dart';
import 'package:union_shop/layout/page_layout.dart';
import 'package:union_shop/models/cart.dart';
import 'package:union_shop/widgets/labeled_dropdown.dart';
import 'package:union_shop/widgets/quantity_selector.dart';

class PersonalisationPage extends StatefulWidget {
  const PersonalisationPage({super.key});

  @override
  State<PersonalisationPage> createState() => _PersonalisationPageState();
}

class _PersonalisationPageState extends State<PersonalisationPage> {
  final TextEditingController _line1Controller = TextEditingController();
  final TextEditingController _line2Controller = TextEditingController();

  static const List<String> _lineOptions = [
    'One line of text',
    'Two lines of text',
  ];

  String _selectedLines = _lineOptions.first;
  int _quantity = 1;

  double get _pricePerItem =>
      _selectedLines == 'Two lines of text' ? 5.0 : 3.0;

  double get _totalPrice => _pricePerItem * _quantity;

  bool get _isTwoLines => _selectedLines == 'Two lines of text';

  @override
  void dispose() {
    _line1Controller.dispose();
    _line2Controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PageLayout(
      child: LayoutBuilder(
        builder: (context, constraints) {
          final width = constraints.maxWidth;
          final horizontalPadding = width >= 1200
              ? 200.0
              : width >= 900
                  ? 150.0
                  : width >= 600
                      ? 60.0
                      : 20.0;

          return Padding(
            padding: EdgeInsets.symmetric(
              horizontal: horizontalPadding,
              vertical: 32,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Personalisation',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'Add custom text to your print. Choose how many lines you need, '
                  'enter your wording, and we will handle the rest.',
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.grey.shade800,
                    height: 1.5,
                  ),
                ),
                const SizedBox(height: 24),
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.grey.shade200),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.04),
                        blurRadius: 12,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Expanded(
                              child: LabeledDropdown(
                                label: 'Per line',
                                value: _selectedLines,
                                items: _lineOptions,
                                onChanged: (value) {
                                  if (value != null) {
                                    setState(() {
                                      _selectedLines = value;
                                    });
                                  }
                                },
                              ),
                            ),
                            const SizedBox(width: 16),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                const Text(
                                  'Price',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  '£${_pricePerItem.toStringAsFixed(2)}',
                                  style: const TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFF4d2963),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        _buildTextField(
                          label: 'Personalisation line 1',
                          controller: _line1Controller,
                        ),
                        if (_isTwoLines) ...[
                          const SizedBox(height: 14),
                          _buildTextField(
                            label: 'Personalisation line 2',
                            controller: _line2Controller,
                          ),
                        ],
                        const SizedBox(height: 20),
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
                        const SizedBox(height: 12),
                        Text(
                          'Total: £${_totalPrice.toStringAsFixed(2)}',
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const SizedBox(height: 18),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: _handleAddToCart,
                            style: ElevatedButton.styleFrom(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 14),
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
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildTextField({
    required String label,
    required TextEditingController controller,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 6),
        TextField(
          controller: controller,
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            hintText: 'Enter text',
          ),
        ),
      ],
    );
  }

  void _handleAddToCart() {
    final itemId = _isTwoLines ? 'personalisation-2' : 'personalisation-1';
    final itemTitle =
        _isTwoLines ? 'Print personalisation (two lines)' : 'Print personalisation (one line)';

    cart.addItem(
      id: itemId,
      title: itemTitle,
      price: _pricePerItem,
      imageUrl: 'assets/images/essential_hoodie.png',
      quantity: _quantity,
    );

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Added personalisation to cart'),
        duration: Duration(seconds: 1),
      ),
    );
  }
}
