import 'package:flutter/material.dart';
import 'package:union_shop/pages/about_page.dart';
import 'package:union_shop/pages/collection_page.dart';
import 'package:union_shop/pages/collections_page.dart';
import 'package:union_shop/pages/login_page.dart';
import 'package:union_shop/pages/home_page.dart';
import 'package:union_shop/pages/cart_page.dart';
import 'package:union_shop/pages/product_page.dart';
import 'package:union_shop/pages/sale_page.dart';
import 'package:union_shop/pages/signup_page.dart';
import 'package:union_shop/pages/personalisation_page.dart';
import 'package:union_shop/pages/print_about_page.dart';
import 'package:union_shop/pages/search_page.dart';

void main() {
  runApp(const UnionShopApp());
}

class UnionShopApp extends StatelessWidget {
  const UnionShopApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Union Shop',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF4d2963)),
        fontFamily: 'Roboto',
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const HomePage(),
        '/about': (context) => const AboutPage(),
        '/collection': (context) => const CollectionPage(),
        '/product': (context) => const ProductPage(),
        '/sale': (context) => const SalePage(),
        '/clothing': (context) => const CollectionsPage(),
        '/collections': (context) => const CollectionsPage(),
        '/cart': (context) => const CartPage(),
        '/merch': (context) => const SimplePage(title: 'Merch'),
        '/halloween': (context) => const SimplePage(title: 'Halloween'),
        '/sig-essential': (context) =>
            const SimplePage(title: 'Signature Essential'),
        '/city-collection': (context) =>
            const SimplePage(title: 'City Collection'),
        '/pride': (context) => const SimplePage(title: 'Pride'),
        '/graduation': (context) => const SimplePage(title: 'Graduation'),
        '/print-about': (context) => const PrintAboutPage(),
        '/personalisation': (context) => const PersonalisationPage(),
        '/login': (context) => const LoginPage(),
        '/signup': (context) => const SignupPage(),
        '/search': (context) => const SearchPage(),
      },
    );
  }
}

class SimplePage extends StatelessWidget {
  final String title;

  const SimplePage({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Text(
          title,
          style: const TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
