import 'package:flutter/material.dart';
import 'package:union_shop/layout/page_layout.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const PageLayout(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'About us',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.black,
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
              style: TextStyle(fontSize: 16, height: 1.5),
            )
          ],
        ),
      ),
    );
  }
}
