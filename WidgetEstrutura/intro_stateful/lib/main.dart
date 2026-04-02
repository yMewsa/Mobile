import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(MaterialApp(home: MyApp()));
}

// Importa as caracateristicas da pag StateFul
class MyApp extends StatefulWidget {
  const MyApp({super.key});

  // Método para identificar as mudanças de estado e chamar a reconstrução da janela
  @override //Reescrita de um método existente
  State<MyApp> createState() {
    return _MyAppState();
  }
}

// Class para a construção da lógica e da estrutura da janela
class _MyAppState extends State<MyApp> {
  // A classe normal da aplicação
  // Atributos
  int contador = 0;

  // Método build da tela (Obrigatório do StateFul)
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // AppBar
      appBar: AppBar(title: Text("Aplicativo com StateFul - Contador"),),
      // Body
      // Container para espaçamento interno
      body: Padding(
        padding: EdgeInsets.all(8), //Margem de todas as bordas em 8px
        // child: Center -> Centralizar os Elementos (Esquerda e Direita)
        child: Center(
          // Column -> permite adicionar mai de um elemento
          child: Column(
            // Centraliza os elementos no Eixo Principal da Column (Y)
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Nº de Click: $contador", style: TextStyle(fontSize: 20),),
              // Add botão -> Quando pressionado muda o estado
              ElevatedButton(
                onPressed: (){
                  // Adiciona SetState (Mudança de Estado)
                  setState(() {
                    // Colocar uma modificação na tela
                    contador++; //Adiciona 1 ao contador
                  });
                },
                child: Text("Adicionar +1"),
              )
            ],
          ),
        ),
        ), 
    );
  }
}
