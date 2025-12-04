import 'package:flutter/material.dart';
import 'package:union_shop/layout/page_layout.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Reuse the shared page layout (header + footer).
    return PageLayout(
      child: LayoutBuilder(
        builder: (context, constraints) {
          final width = constraints.maxWidth;
          // Adjust side padding so content stays readable on all screen sizes.
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
              vertical: 40,
            ),
            child: Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 900),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Text(
                        'About us',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    SizedBox(height: 24),
                    Text(
                      'Welcome to the Union Shop!\n\n'
                      'We’re dedicated to giving you the very best University branded products, '
                      'with a range of clothing and merchandise available to shop all year round! '
                      'We even offer an exclusive personalisation service!\n\n'
                      'All online purchases are available for delivery or instore collection.\n\n'
                      'We hope you enjoy our products as much as we enjoy offering them to you. '
                      'If you have any questions or comments, please don’t hesitate to contact us at hello@upsu.net.\n\n'
                      'Happy shopping!\n\n'
                      'The Union Shop & Reception Team',
                      textAlign: TextAlign.left,
                      style: TextStyle(fontSize: 16, height: 1.6),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
