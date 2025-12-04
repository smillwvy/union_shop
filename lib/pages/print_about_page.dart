import 'package:flutter/material.dart';
import 'package:union_shop/layout/page_layout.dart';

class PrintAboutPage extends StatelessWidget {
  const PrintAboutPage({super.key});

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

          return SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: horizontalPadding,
                vertical: 32,
              ),
              child: Center(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 1100),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const Center(
                        child: Text(
                          'The Union Print Shack',
                          style: TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(height: 24),
                      const SizedBox(height: 32),
                      _buildSection(
                        title: 'Make It Yours at The Union Print Shack',
                        body:
                            'Want to add a personal touch? We\'ve got you covered with heat-pressed customisation on all our clothing. '
                            'Swing by the shop - our team\'s always happy to help you pick the right gear and answer any questions.',
                      ),
                      const SizedBox(height: 20),
                      _buildSection(
                        title: 'Uni Gear or Your Gear - We\'ll Personalise It',
                        body:
                            'Whether you\'re repping your university or putting your own spin on a hoodie you already own, we\'ve got you covered. '
                            'We can personalise official uni-branded clothing and your own items - just bring them in and let\'s get creative!',
                      ),
                      const SizedBox(height: 20),
                      _buildSection(
                        title: 'Simple Pricing, No Surprises',
                        body:
                            'Customising your gear won\'t break the bank - just £3 for one line of text or a small chest logo, and £5 for two lines or a large back logo. '
                            'Turnaround time is up to three working days, and we\'ll let you know as soon as it\'s ready to collect.',
                      ),
                      const SizedBox(height: 20),
                      _buildSection(
                        title: 'Personalisation Terms & Conditions',
                        body:
                            'We will print your clothing exactly as you have provided it to us, whether online or in person. '
                            'We are not responsible for any spelling errors. Please ensure your chosen text is clearly displayed in either capitals or lowercase. '
                            'Refunds are not provided for any personalised items.',
                      ),
                      const SizedBox(height: 20),
                      _buildSection(
                        title: 'Ready to Make It Yours?',
                        body:
                            'Pop in or get in touch today - let\'s create something uniquely you with our personalisation service - The Union Print Shack!',
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildSection({required String title, required String body}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          body,
          style: TextStyle(
            fontSize: 15,
            color: Colors.grey.shade800,
            height: 1.6,
          ),
        ),
      ],
    );
  }
}
