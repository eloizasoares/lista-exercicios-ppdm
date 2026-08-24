import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DesafioLista extends StatefulWidget {
  const DesafioLista({super.key});

  @override
  State<DesafioLista> createState() => _DesafioListaState();
}

class _DesafioListaState extends State<DesafioLista> {
  // EXERCÍCIO 02
  String tamanhoFonte = 'Médio';

  // EXERCÍCIO 03
  bool receberNotificacoes = false;

  @override
  void initState() {
    super.initState();
    carregarConfiguracoes();
  }

  Future<void> carregarConfiguracoes() async {
    final prefs = await SharedPreferences.getInstance();

    setState(() {
      // Exercício 02
      tamanhoFonte = prefs.getString('tamanhoFonte') ?? 'Médio';

      // Exercício 03
      receberNotificacoes =
          prefs.getBool('receberNotificacoes') ?? false;
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
            // TÍTULO
            Text(
              'Tamanho da Fonte',
              style: TextStyle(
                fontSize: obterTamanhoFonte(),
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 10),

            // DROPDOWN DO EXERCÍCIO 02
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

            const SizedBox(height: 25),

            // TÍTULO DAS NOTIFICAÇÕES
            Text(
              'Notificações',
              style: TextStyle(
                fontSize: obterTamanhoFonte(),
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 10),

            // SWITCH DO EXERCÍCIO 03
            SwitchListTile(
              contentPadding: EdgeInsets.zero,

              title: Text(
                'Receber Notificações',
                style: TextStyle(
                  fontSize: obterTamanhoFonte(),
                ),
              ),

              value: receberNotificacoes,

              onChanged: (valor) async {
                final prefs =
                    await SharedPreferences.getInstance();

                await prefs.setBool(
                  'receberNotificacoes',
                  valor,
                );

                setState(() {
                  receberNotificacoes = valor;
                });
              },
            ),

            const SizedBox(height: 20),

            // MOSTRA O ESTADO ATUAL
            Text(
              receberNotificacoes
                  ? 'Notificações ativadas'
                  : 'Notificações desativadas',

              style: TextStyle(
                fontSize: obterTamanhoFonte(),
              ),
            ),

            const SizedBox(height: 20),

            // TEXTO DO TAMANHO ATUAL
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