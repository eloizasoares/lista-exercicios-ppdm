import 'package:flutter/material.dart';
import 'product.dart';

class AddProductScreen extends StatefulWidget {
  const AddProductScreen({super.key});

  @override
  State<AddProductScreen> createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  final TextEditingController nomeController = TextEditingController();
  final TextEditingController precoController = TextEditingController();

  void cadastrarProduto() {
    String nome = nomeController.text;

    double? preco = double.tryParse(
      precoController.text.replaceAll(',', '.'),
    );

    if (nome.isEmpty || preco == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Preencha os campos corretamente.'),
        ),
      );
      return;
    }

    Product produto = Product(
      name: nome,
      price: preco,
    );

    Navigator.pop(context, produto);
  }

  Future<bool> confirmarSaida() async {
    final bool? resultado = await showDialog<bool>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Deseja voltar?'),
          content: const Text(
            'As informações preenchidas serão perdidas.',
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context, false);
              },
              child: const Text('Cancelar'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context, true);
              },
              child: const Text('Voltar'),
            ),
          ],
        );
      },
    );

    return resultado ?? false;
  }

  Future<void> tentarVoltar() async {
    final confirmou = await confirmarSaida();

    if (confirmou) {
      Navigator.pop(context);
    }
  }

  @override
  void dispose() {
    nomeController.dispose();
    precoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) async {
        if (didPop) {
          return;
        }

        await tentarVoltar();
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Adicionar Produto'),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: tentarVoltar,
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              TextField(
                controller: nomeController,
                decoration: const InputDecoration(
                  labelText: 'Nome do produto',
                  border: OutlineInputBorder(),
                ),
              ),

              const SizedBox(height: 16),

              TextField(
                controller: precoController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Preço',
                  border: OutlineInputBorder(),
                ),
              ),

              const SizedBox(height: 20),

              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: cadastrarProduto,
                  child: const Text('Cadastrar produto'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}