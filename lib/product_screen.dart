import 'package:flutter/material.dart';
import 'add_product_screen.dart';
import 'product.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  final List<Product> produtos = [
    Product(name: 'Notebook', price: 3500.00),
    Product(name: 'Mouse', price: 80.00),
    Product(name: 'Teclado', price: 150.00),
  ];

  Future<void> adicionarProduto() async {
    final Product? novoProduto = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const AddProductScreen(),
      ),
    );

    if (novoProduto != null) {
      setState(() {
        produtos.add(novoProduto);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de Produtos'),
      ),

      body: ListView.builder(
        itemCount: produtos.length,
        itemBuilder: (context, index) {
          final produto = produtos[index];

          return ListTile(
            leading: const Icon(Icons.shopping_cart),
            title: Text(produto.name),
            subtitle: Text(
              'R\$ ${produto.price.toStringAsFixed(2)}',
            ),
          );
        },
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: adicionarProduto,
        child: const Icon(Icons.add),
      ),
    );
  }
}