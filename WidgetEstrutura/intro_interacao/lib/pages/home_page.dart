// Tela Inicial
// Botões de Navegação para outras telas

import 'package:flutter/material.dart';
import 'package:intro_interacao/widgets/bnb.dart';

// StateLess -> Uma unica class e o build ja fica contido
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("App Interativo")),
      body: Padding(
        padding: EdgeInsets.all(8),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.network(
                "https://static.wikia.nocookie.net/disney-marvel-gotg/images/c/cf/StarmoraalmostkISS.png/revision/latest?cb=20170325165251",
                width: 150,
                height: 150,
              ),
              // Bloco de Espaçamento
              SizedBox(height: 20),
              // Botões de Navegação
              ElevatedButton(
                onPressed: () => Navigator.pushNamed(context, "/form"),
                child: Text("Responder Formulário"),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () => Navigator.pushNamed(context, "/contato"),
                child: Text("Entre em Contato"),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Bnb(context),
    );
  }
}
