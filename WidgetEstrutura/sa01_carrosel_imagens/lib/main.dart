// Situação de Aprendizagem 01
// Usar uma lista de imagens para montar um carrossel no Flutter
// flutter pub add carousel_slider (Biblioteca do Flutter Pub Get)

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyApp()
    )
  );
}

class MyApp extends StatelessWidget {
   MyApp({super.key});

  // Lista de Imagens
  final List<String> imagens = [
    "https://images.unsplash.com/photo-1506748686214-e9df14d4d9d0",
    "https://images.unsplash.com/photo-1521747116042-5a810fda9664",
    "https://images.unsplash.com/photo-1504384308090-c894fdcc538d",
    "https://images.unsplash.com/photo-1518837695005-2083093ee35b",
    "https://images.unsplash.com/photo-1501594907352-04cda38ebc29",
    "https://images.unsplash.com/photo-1519681393784-d120267933ba",
    "https://images.unsplash.com/photo-1531259683007-016a7b628fc3",
    "https://images.unsplash.com/photo-1506619216599-9d16d0903dfd",
    "https://images.unsplash.com/photo-1494172961521-33799ddd43a5",
    "https://images.unsplash.com/photo-1517245386807-bb43f82c33c4",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Galeria de Imagens"), centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [
            // Carrossel de imagens da Galeria
            CarouselSlider(
              options: CarouselOptions(
                height: 300,
                autoPlay: true
              ),
              items: imagens.map(
                ((url) => Container(
                  margin: EdgeInsets.all(8),
                  child: ClipRRect(
                    borderRadius: BorderRadiusGeometry.circular(10),
                    child: Image.network(url, fit: BoxFit.cover, width: 1000,),
                  )
                ))
              ).toList()),
            // Galeria de Imagens
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3, //Numero de Colunas
                  crossAxisSpacing: 8, //Espaçamento entre Colunas
                  mainAxisSpacing: 8, //Espaçamento entre Linhas
                ),
                itemCount: imagens.length, //Quantidade de Elementos
                // Construtor do Grid
                // Construindo usando um foreach
                itemBuilder:
                    (context, index) => //Arrow Function
                    GestureDetector(
                      onTap: () => _mostrarImagem(context, index),
                      child: ClipRRect(borderRadius: BorderRadiusGeometry.circular(8),
                      child: Image.network(imagens[index], fit: BoxFit.cover,),),
                      ), //Método para mostrar a img no detalhe
                    )
              ),
          ],
        ),
      ),
    );
  }

  void _mostrarImagem(BuildContext context, int index) {
    // imagen -> Endereço URL da Imagem
    // Mostrar imagens com mais detalhe ao ser clicada
    // Precisa do index da imagem para buscar no array
    // showDiaLog -> Mostrar a imagem
    showDialog(
      context: context,
      builder: (context) => Dialog(
        child: Image.network(imagens[index]),
        ),
    );
  }
}
