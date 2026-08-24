import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'widgets/cartao_estudante.dart';

class DesafioLista extends StatefulWidget {
  const DesafioLista({super.key});

  @override
  State<DesafioLista> createState() => _DesafioListaState();
}

class _DesafioListaState extends State<DesafioLista> {
  Future<void> limparConfiguracoes() async {
    final prefs = await SharedPreferences.getInstance();

    await prefs.clear();

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Configurações limpas!'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Carteirinhas dos Estudantes'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            CartaoEstudante(
              nome: 'Ana Silva',
              curso: 'Desenvolvimento de Sistemas',
              email: 'ana@email.com',
              imagem: 'https://i.pravatar.cc/150?img=5',
            ),

            const SizedBox(height: 16),

            CartaoEstudante(
              nome: 'Carlos Santos',
              curso: 'Desenvolvimento de Sistemas',
              email: 'carlos@email.com',
              imagem: 'https://i.pravatar.cc/150?img=12',
            ),

            const SizedBox(height: 16),

            CartaoEstudante(
              nome: 'Mariana Oliveira',
              curso: 'Desenvolvimento de Sistemas',
              email: 'mariana@email.com',
              imagem: 'https://i.pravatar.cc/150?img=47',
            ),

            const SizedBox(height: 24),

            ElevatedButton(
              onPressed: limparConfiguracoes,
              child: const Text('Limpar Configurações'),
            ),
          ],
        ),
      ),
    );
  }
}