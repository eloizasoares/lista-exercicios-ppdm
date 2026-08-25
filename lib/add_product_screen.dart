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
  final TextEditingController observadorController =
      TextEditingController();

  void cadastrarProduto() {
    String nome = nomeController.text;
    String observador = observadorController.text;

    double? preco = double.tryParse(
      precoController.text.replaceAll(',', '.'),
    );

    if (nome.isEmpty || preco == null || observador.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Preencha todos os campos corretamente.'),
        ),
      );
      return;
    }

    Product produto = Product(
      name: nome,
      price: preco,
      observador: observador,
    );

    Navigator.pop(context, produto);
  }

  void limparFormulario() {
    nomeController.clear();
    precoController.clear();
    observadorController.clear();
  }

  @override
  void dispose() {
    nomeController.dispose();
    precoController.dispose();
    observadorController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Adicionar Produto'),
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

            const SizedBox(height: 16),

            TextField(
              controller: observadorController,
              decoration: const InputDecoration(
                labelText: 'Observador',
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 20),

            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: cadastrarProduto,
                    child: const Text('Cadastrar'),
                  ),
                ),

                const SizedBox(width: 10),

                Expanded(
                  child: ElevatedButton(
                    onPressed: limparFormulario,
                    child: const Text('Limpar'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}