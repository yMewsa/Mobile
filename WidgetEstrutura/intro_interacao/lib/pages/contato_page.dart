// Página de Contato

import 'package:flutter/material.dart';
import 'package:intro_interacao/widgets/bnb.dart';

class ContatoPage extends StatefulWidget {
  const ContatoPage({super.key});

  @override
  State<ContatoPage> createState() => _ContatoPageState();
}

class _ContatoPageState extends State<ContatoPage> {
  // Atributos
  // TextEditingController
  final TextEditingController _nomeController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _telefoneController = TextEditingController();
  final TextEditingController _mensagemController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Contato"), centerTitle: true),
      body: Padding(
        padding: EdgeInsets.all(8),
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Usaremos form
              // Nome, email, Telefone e Mensagem
              // Sem form não existe validator
              TextField(
                controller: _nomeController,
                decoration: InputDecoration(labelText: "Nome..."),
              ),
              SizedBox(height: 20),

              TextField(
                controller: _emailController,
                decoration: InputDecoration(labelText: "Email..."),
              ),
              SizedBox(height: 20),

              TextField(
                controller: _telefoneController,
                decoration: InputDecoration(labelText: "Telefone..."),
              ),
              SizedBox(height: 20),

              TextField(
                controller: _mensagemController,
                decoration: InputDecoration(labelText: "Mensagem..."),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () => _enviarMensagem(),
                child: Text("Enviar Mensagem"),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Bnb(context),
    );
  }

  void _enviarMensagem() {
    //  Exibir um dialogo de confirmação
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Confirmação de Envio"),
        content: SingleChildScrollView(
          child: ListBody(
            children: [
              Text("Deseja Enviar a Seguinte Mensagem?"),
              SizedBox(height: 20),
              Text("Nome: ${_nomeController.text}"),
              Text("Email: ${_emailController.text}"),
              Text("Telefone: ${_telefoneController.text}"),
              Text("Mensagem: ${_mensagemController.text}"),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text("Cancelar"),
          ),
          ElevatedButton(
            onPressed: () {
              // Envia a mensagem
              // Limpa os campos
              _nomeController.clear();
              _emailController.clear();
              _telefoneController.clear();
              _mensagemController.clear();
              Navigator.popAndPushNamed(context, "/");
            },
            child: Text("Enviar"),
          ),
        ],
      ),
    );
  }
}
