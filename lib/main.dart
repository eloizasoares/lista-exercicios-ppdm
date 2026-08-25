import 'package:flutter/material.dart';
import 'product_screen.dart';
import 'add_product_screen.dart';

void main() {
  runApp(const MeuApp());
}

class MeuApp extends StatelessWidget {
  const MeuApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      title: 'Produtos',

      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blue,
        ),
        useMaterial3: true,
      ),

      initialRoute: '/',

      routes: {
        '/': (context) => const ProductScreen(),
        '/adicionar': (context) => const AddProductScreen(),
      },
    );
  }
}