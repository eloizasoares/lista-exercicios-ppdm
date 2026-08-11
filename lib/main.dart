import 'package:flutter/material.dart';
import 'desafio_lista.dart';

void main() {
  runApp(const MeuApp());
}

class MeuApp extends StatelessWidget {
  const MeuApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Atividade 013',
      home: const DesafioLista(),
    );
  }
}