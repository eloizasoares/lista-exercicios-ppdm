import 'package:flutter/material.dart';

class CartaoEstudante extends StatelessWidget {
  final String nome;
  final String curso;
  final String email;
  final String imagem;

  const CartaoEstudante({
    super.key,
    required this.nome,
    required this.curso,
    required this.email,
    required this.imagem,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.green.shade50,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          CircleAvatar(
            radius: 50,
            foregroundImage: NetworkImage(imagem),
          ),

          const SizedBox(height: 10),

          Text(
            nome,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 8),

          Row(
            children: [
              const Icon(
                Icons.school,
                color: Colors.green,
              ),
              const SizedBox(width: 8),
              Text(curso),
            ],
          ),

          const SizedBox(height: 8),

          Row(
            children: [
              const Icon(
                Icons.email,
                color: Colors.green,
              ),
              const SizedBox(width: 8),
              Text(email),
            ],
          ),

          const SizedBox(height: 8),

          Row(
            children: [
              const Icon(
                Icons.check_circle,
                color: Colors.green,
              ),
              const SizedBox(width: 8),
              const Text('Status: Matriculado / Ativo'),
            ],
          ),

          const SizedBox(height: 10),

          ElevatedButton(
            onPressed: () {},
            child: const Text('Validar Carteirinha'),
          ),
        ],
      ),
    );
  }
}