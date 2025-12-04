import 'package:flutter/material.dart';
import 'package:union_shop/layout/page_layout.dart';

class CollectionPage extends StatefulWidget {
  const CollectionPage({super.key});

  @override
  State<CollectionPage> createState() => _CollectionPageState();
}

class _CollectionPageState extends State<CollectionPage> {
  // Track current filter and sort selection.
  String _selectedFilter = 'All products';
  String _selectedSort = 'Featured';

  @override
  Widget build(BuildContext context) {
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
              // Page title + subtitle.
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
              const SizedBox(height: 20),
              // Filters and sort dropdowns.
              _buildFilterSortBar(),
              const SizedBox(height: 24),
              // Placeholder where product grid would go.
              const Center(
                child: Text(
                  'Clothing collection page (placeholder)',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFilterSortBar() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            // Filter dropdown.
            _buildDropdown(
              label: 'FILTER BY',
              value: _selectedFilter,
              items: const [
                DropdownMenuItem(
                  value: 'All products',
                  child: Text('All products'),
                ),
                DropdownMenuItem(
                  value: 'Hoodies',
                  child: Text('Hoodies'),
                ),
                DropdownMenuItem(
                  value: 'T-Shirts',
                  child: Text('T-Shirts'),
                ),
              ],
              onChanged: (value) {
                if (value == null) return;
                setState(() {
                  _selectedFilter = value;
                });
              },
            ),
            const SizedBox(width: 12),
            // Sort dropdown.
            _buildDropdown(
              label: 'SORT BY',
              value: _selectedSort,
              items: const [
                DropdownMenuItem(
                  value: 'Featured',
                  child: Text('Featured'),
                ),
                DropdownMenuItem(
                  value: 'Price: low to high',
                  child: Text('Price: low to high'),
                ),
                DropdownMenuItem(
                  value: 'Price: high to low',
                  child: Text('Price: high to low'),
                ),
              ],
              onChanged: (value) {
                if (value == null) return;
                setState(() {
                  _selectedSort = value;
                });
              },
            ),
            const SizedBox(width: 12),
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

  Widget _buildDropdown({
    required String label,
    required String value,
    required List<DropdownMenuItem<String>> items,
    required ValueChanged<String?> onChanged,
  }) {
    // Reusable dropdown with a label on the left.
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
              items: items,
              onChanged: onChanged,
            ),
          ),
        ),
      ],
    );
  }
}
