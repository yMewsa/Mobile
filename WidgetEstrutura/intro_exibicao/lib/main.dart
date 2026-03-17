// Tela para estudo dos widgets de exibição
// Text, Image, Icon, etc...
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      // Router -> Rotas de Navegação
      // Home -> Pagina Inicial
      home: MyApp(),

      // ThemeApp -> Claro/Escuro
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // Estrutura da Tela
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //Elemento Principal da Tela
      // Appbar, Drawer, bnBar, Body, FAButton, SnakeBar
      appBar: AppBar(title: Text("Exemplos de Widget Exibição")),

      // Adicionar um elemento de Scroll
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Explorando o Flutter",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),
              // Dentro da Column
              // Adicionar uma Image
              Image.network(
                // Link URL da Imagem - SquareSpace
                "https://cdn.cosmos.so/7e95b55a-5cff-43b8-8181-9a52d3b8ec29.?format=jpeg",
                height: 400,
                fit: BoxFit.contain,
              ),
              Image.asset(
                // Imagem local no app
                "assets/images/flor.jpg",
                height: 400,
                fit: BoxFit.cover,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
