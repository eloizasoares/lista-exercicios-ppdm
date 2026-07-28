import 'package:flutter/material.dart';

void main() {
  runApp(const MeuApp());
}

class MeuApp extends StatelessWidget {
  const MeuApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Cadastro(),
    );
  }
}

class Cadastro extends StatefulWidget {
  @override
  State<Cadastro> createState() => _CadastroState();
}

class _CadastroState extends State<Cadastro> {

  final TextEditingController nomeController = TextEditingController();
  final TextEditingController cargoController = TextEditingController();

  String nome = "";
  String cargo = "";

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: const Text("Cadastro"),
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),

        child: SingleChildScrollView(
          child: Column(

            children: [

              TextFormField(
                controller: nomeController,
                decoration: const InputDecoration(
                  labelText: "Nome",
                  border: OutlineInputBorder(),
                ),
              ),

              const SizedBox(height: 20),

              TextFormField(
                controller: cargoController,
                decoration: const InputDecoration(
                  labelText: "Profissão/Cargo",
                  border: OutlineInputBorder(),
                ),
              ),

              const SizedBox(height: 20),

              ElevatedButton(
                onPressed: () {

                  setState(() {
                    nome = nomeController.text;
                    cargo = cargoController.text;
                  });

                },
                child: const Text("Cadastrar"),
              ),

              const SizedBox(height: 30),

              if(nome.isNotEmpty)

                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(20),

                    child: Text(
                      "Bem-vindo(a), $nome!\nCargo cadastrado: $cargo",
                      style: const TextStyle(fontSize: 18),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}