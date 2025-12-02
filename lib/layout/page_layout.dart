import 'package:flutter/material.dart';

class PageLayout extends StatelessWidget {
  final Widget child;

  const PageLayout({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            buildHeader(context),
            child,
            buildFooter(context),
          ],
        ),
      ),
    );
  }
}

Widget buildHeader(BuildContext context) {
  void navigateTo(String route, {bool clear = false}) {
    if (clear) {
      Navigator.pushNamedAndRemoveUntil(context, route, (route) => false);
    } else {
      Navigator.pushNamed(context, route);
    }
  }

  return Container(
    height: 100,
    color: Colors.white,
    child: Column(
      children: [
        // Top banner
        Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(vertical: 8),
          color: const Color(0xFF4d2963),
          child: const Text(
            'BIG SALE! OUR ESSENTIAL RANGE HAS DROPPED IN PRICE! OVER 20% OFF! COME GRAB YOURS WHILE STOCK LASTS!',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white, fontSize: 17),
          ),
        ),
        Expanded(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              children: [
                // Logo link to home
                GestureDetector(
                  onTap: () => navigateTo('/', clear: true),
                  child: Image.network(
                    'https://shop.upsu.net/cdn/shop/files/upsu_300x300.png?v=1614735854',
                    height: 18,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        color: Colors.grey[300],
                        width: 18,
                        height: 18,
                        child: const Center(
                          child: Icon(Icons.image_not_supported,
                              color: Colors.grey),
                        ),
                      );
                    },
                  ),
                ),
                const Spacer(),
                // Nav links + dropdown
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      TextButton(
                        onPressed: () => navigateTo('/', clear: true),
                        child: const Text('Home'),
                      ),
                      TextButton(
                        onPressed: () => navigateTo('/sale'),
                        child: const Text('Sale'),
                      ),
                      PopupMenuButton<String>(
                        onSelected: (value) => navigateTo(value),
                        itemBuilder: (context) => const [
                          PopupMenuItem(
                            value: '/clothing',
                            child: Text('Clothing'),
                          ),
                          PopupMenuItem(
                            value: '/merch',
                            child: Text('Merch'),
                          ),
                          PopupMenuItem(
                            value: '/halloween',
                            child: Text('Halloween'),
                          ),
                          PopupMenuItem(
                            value: '/sig-essential',
                            child: Text('Signature Essential'),
                          ),
                          PopupMenuItem(
                            value: '/city-collection',
                            child: Text('City Collection'),
                          ),
                          PopupMenuItem(
                            value: '/pride',
                            child: Text('Pride'),
                          ),
                          PopupMenuItem(
                            value: '/graduation',
                            child: Text('Graduation'),
                          ),
                          PopupMenuItem(
                            value: '/print-about',
                            child: Text('Print About'),
                          ),
                          PopupMenuItem(
                            value: '/personalisation',
                            child: Text('Personalisation'),
                          ),
                        ],
                        child: const Text('Shop ▾'),
                      ),
                      TextButton(
                        onPressed: () => navigateTo('/about'),
                        child: const Text('About'),
                      ),
                      TextButton(
                        onPressed: () => navigateTo('/product'),
                        child: const Text('Product'),
                      ),
                    ],
                  ),
                ),
                ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 600),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // Header icons
                      IconButton(
                        icon: const Icon(
                          Icons.search,
                          size: 18,
                          color: Colors.grey,
                        ),
                        padding: const EdgeInsets.all(8),
                        constraints: const BoxConstraints(
                          minWidth: 32,
                          minHeight: 32,
                        ),
                        onPressed: () {},
                      ),
                      IconButton(
                        icon: const Icon(
                          Icons.person_outline,
                          size: 18,
                          color: Colors.grey,
                        ),
                        padding: const EdgeInsets.all(8),
                        constraints: const BoxConstraints(
                          minWidth: 32,
                          minHeight: 32,
                        ),
                        onPressed: () {},
                      ),
                      IconButton(
                        icon: const Icon(
                          Icons.shopping_bag_outlined,
                          size: 18,
                          color: Colors.grey,
                        ),
                        padding: const EdgeInsets.all(8),
                        constraints: const BoxConstraints(
                          minWidth: 32,
                          minHeight: 32,
                        ),
                        onPressed: () {},
                      ),
                      IconButton(
                        icon: const Icon(
                          Icons.menu,
                          size: 18,
                          color: Colors.grey,
                        ),
                        padding: const EdgeInsets.all(8),
                        constraints: const BoxConstraints(
                          minWidth: 32,
                          minHeight: 32,
                        ),
                        onPressed: () {},
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    ),
  );
}

Widget buildFooter(BuildContext context) {
  return Container(
    width: double.infinity,
    color: Colors.grey.shade100,
    padding: const EdgeInsets.all(24),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Opening hours
        const Text(
          'Opening Hours',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        const Text(
          '❄️ Winter Break Closure Dates ❄️\n'
          'Closing 4pm 19/12/2025\n'
          'Reopening 10am 06/01/2026\n\n'
          'Last post date: 12pm on 18/12/2025\n\n'
          '--------------------------------------------------------------------------\n\n'
          'Monday - Friday: 10am - 4pm\n'
          'Outside term time: Monday - Friday: 10am - 3pm\n'
          'Purchase online 24/7',
          style: TextStyle(fontSize: 14),
        ),
        const SizedBox(height: 24),
        // Help links
        const Text(
          'Help & Information',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        const Text(
          'Search\nTerms & Conditions of Sale\nPolicy',
          style: TextStyle(fontSize: 14),
        ),
        const SizedBox(height: 24),
        // Newsletter
        const Text(
          'Latest Offers',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            const Expanded(
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Email address',
                  border: OutlineInputBorder(),
                  isDense: true,
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 10, horizontal: 12),
                ),
              ),
            ),
            const SizedBox(width: 8),
            SizedBox(
              height: 42,
              child: ElevatedButton(
                onPressed: () {},
                child: const Text('Subscribe'),
              ),
            ),
          ],
        ),
        const SizedBox(height: 24),
        const Text(
          '(c) 2025 Union Shop - Coursework project',
          style: TextStyle(
            fontSize: 12,
            color: Colors.grey,
          ),
        ),
      ],
    ),
  );
}
