import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DesafioLista extends StatefulWidget {
  const DesafioLista({super.key});

  @override
  State<DesafioLista> createState() => _DesafioListaState();
}

class _DesafioListaState extends State<DesafioLista> {
  // EXERCÍCIO 02 - Tamanho da fonte
  String tamanhoFonte = 'Médio';

  @override
  void initState() {
    super.initState();
    carregarConfiguracoes();
  }

  Future<void> carregarConfiguracoes() async {
    final prefs = await SharedPreferences.getInstance();

    setState(() {
      tamanhoFonte = prefs.getString('tamanhoFonte') ?? 'Médio';
    });
  }

  double obterTamanhoFonte() {
    switch (tamanhoFonte) {
      case 'Pequeno':
        return 14;
      case 'Grande':
        return 22;
      default:
        return 18;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Configurações',
          style: TextStyle(
            fontSize: obterTamanhoFonte(),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Tamanho da Fonte',
              style: TextStyle(
                fontSize: obterTamanhoFonte(),
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 10),

            DropdownButton<String>(
              value: tamanhoFonte,
              isExpanded: true,
              items: const [
                DropdownMenuItem(
                  value: 'Pequeno',
                  child: Text('Pequeno'),
                ),
                DropdownMenuItem(
                  value: 'Médio',
                  child: Text('Médio'),
                ),
                DropdownMenuItem(
                  value: 'Grande',
                  child: Text('Grande'),
                ),
              ],
              onChanged: (valor) async {
                if (valor == null) return;

                final prefs =
                    await SharedPreferences.getInstance();

                await prefs.setString(
                  'tamanhoFonte',
                  valor,
                );

                setState(() {
                  tamanhoFonte = valor;
                });
              },
            ),

            const SizedBox(height: 30),

            Text(
              'Configurações',
              style: TextStyle(
                fontSize: obterTamanhoFonte(),
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 15),

            Text(
              'Escolha o tamanho da fonte que deseja utilizar no aplicativo.',
              style: TextStyle(
                fontSize: obterTamanhoFonte(),
              ),
            ),

            const SizedBox(height: 20),

            Text(
              'Tamanho selecionado: $tamanhoFonte',
              style: TextStyle(
                fontSize: obterTamanhoFonte(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}