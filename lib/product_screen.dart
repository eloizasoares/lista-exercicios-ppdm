import 'package:flutter/material.dart';
import 'product.dart';
import 'add_product_screen.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  final List<Product> produtos = [
    Product(
      name: 'Notebook',
      price: 3500.00,
      observador: 'Sistema',
    ),
    Product(
      name: 'Mouse',
      price: 80.00,
      observador: 'Sistema',
    ),
    Product(
      name: 'Teclado',
      price: 150.00,
      observador: 'Sistema',
    ),
  ];

  void adicionarProduto(Product novoProduto) {
    setState(() {
      produtos.add(novoProduto);
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          'Produto cadastrado! Total: ${produtos.length}',
        ),
      ),
    );
  }

  void abrirTelaAdicionarProduto() async {
    final novoProduto = await Navigator.push<Product>(
      context,
      MaterialPageRoute(
        builder: (context) => const AddProductScreen(),
      ),
    );

    if (novoProduto != null) {
      adicionarProduto(novoProduto);
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
              'R\$ ${produto.price.toStringAsFixed(2)} - Observador: ${produto.observador}',
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: abrirTelaAdicionarProduto,
        child: const Icon(Icons.add),
      ),
    );
  }
}