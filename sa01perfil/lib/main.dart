import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      scrollBehavior: const MaterialScrollBehavior().copyWith(
        overscroll: false,
      ),
      theme: ThemeData(fontFamily: 'Roboto'),
      home: const ProfileScreen(),
    );
  }
}

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  final Color bgColor = const Color(0xFFFCF2EB);
  final Color headerColor = const Color(0xFFDFDDDF);
  final Color darkMaroon = const Color(0xFF450D22);
  final Color pinkCardBg = const Color(0xFFFFB2C0);
  final Color darkPinkCard = const Color(0xFFD76282);
  final Color socialMaroon = const Color(0xFF99355B);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            // 1. SEÇÃO SUPERIOR (Capa, Avatar, Textos)
            SizedBox(
              height: 275,
              child: Stack(
                children: [
                  // wallpaper
                  Container(height: 155, color: headerColor),

                  // voltar
                  Positioned(
                    top: 50,
                    left: 16,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 14,
                        vertical: 6,
                      ),
                      decoration: BoxDecoration(
                        color: darkMaroon,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Row(
                        children: [
                          Icon(Icons.arrow_back, color: Colors.white, size: 16),
                          SizedBox(width: 4),
                          Text(
                            "Voltar",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  // config
                  Positioned(
                    top: 50,
                    right: 16,
                    child: Container(
                      padding: const EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        color: darkMaroon,
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.settings,
                        color: Colors.white,
                        size: 22,
                      ),
                    ),
                  ),

                  // user e bio
                  Positioned(
                    top: 170,
                    left: 16,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Britney Spears",
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        const SizedBox(height: 6),
                        Text(
                          "“It’s Britney b*tch.”",
                          style: TextStyle(fontSize: 16, color: Colors.black87),
                        ),
                      ],
                    ),
                  ),

                  // pfp
                  Positioned(
                    top: 75,
                    right: 24,
                    child: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: darkMaroon, width: 4),
                      ),
                      child: const CircleAvatar(
                        radius: 65,
                        backgroundColor: Colors.white,
                        child: Icon(Icons.person, size: 70, color: Colors.grey),
                        // image: DecorationImage(
                        //   image: NetworkImage(
                        //     "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSCnPyT_LI9jJ2-G7vBaDZYF6hJiZsfeFi19Q&s",
                        //   ),
                        // ),
                      ),
                    ),
                  ),

                  Positioned(
                    top: 220,
                    right: 40,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 18,
                        vertical: 8,
                      ),
                      decoration: BoxDecoration(
                        color: darkMaroon,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: const Text(
                        "+ Seguir",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: pinkCardBg,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Container 1
                    Expanded(
                      child: Container(
                        height: 100,
                        decoration: BoxDecoration(
                          color: darkPinkCard,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: darkMaroon,
                              ),
                              padding: const EdgeInsets.all(4),
                              child: Icon(
                                Icons.star,
                                color: darkPinkCard,
                                size: 22,
                              ),
                            ),
                            const SizedBox(height: 8),
                            const Text(
                              "Diva Pop",
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: Colors.black87,
                                fontSize: 13,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),

                    // Container 2
                    Expanded(
                      child: Container(
                        height: 100,
                        decoration: BoxDecoration(
                          color: darkPinkCard,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "34.6M",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w900,
                                color: Colors.black,
                              ),
                            ),
                            SizedBox(height: 4),
                            Text(
                              "Seguidores",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.black87,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),

                    // Container 3
                    Expanded(
                      child: Container(
                        height: 100,
                        decoration: BoxDecoration(
                          color: darkPinkCard,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "50.3M",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w900,
                                color: Colors.black,
                              ),
                            ),
                            SizedBox(height: 4),
                            Text(
                              "Ouvintes\nMensais",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.black87,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 20),
                decoration: BoxDecoration(
                  color: pinkCardBg,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    // icone transmissão
                    Container(
                      width: 55,
                      height: 55,
                      decoration: BoxDecoration(
                        color: socialMaroon,
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.sensors,
                        color: Colors.white,
                        size: 28,
                      ),
                    ),
                    // icone xwitter
                    Container(
                      width: 55,
                      height: 55,
                      decoration: BoxDecoration(
                        color: socialMaroon,
                        shape: BoxShape.circle,
                      ),
                      child: const Center(
                        child: Text(
                          "𝕏",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 26,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    // icone fotos
                    Container(
                      width: 55,
                      height: 55,
                      decoration: BoxDecoration(
                        color: socialMaroon,
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.camera_alt_outlined,
                        color: Colors.white,
                        size: 28,
                      ),
                    ),
                    // icone youtube music
                    Container(
                      width: 55,
                      height: 55,
                      decoration: BoxDecoration(
                        color: socialMaroon,
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.play_circle_outline,
                        color: Colors.white,
                        size: 28,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: pinkCardBg,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: RichText(
                  text: const TextSpan(
                    style: TextStyle(
                      color: Colors.black87,
                      fontSize: 14.5,
                      height: 1.3,
                    ),
                    children: [
                      TextSpan(
                        text: "Habilidades: ",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      TextSpan(
                        text:
                            "Dança, composição musical, escrita criativa e storytelling.\n",
                      ),
                      TextSpan(
                        text: "Localização: ",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      TextSpan(text: "Los Angeles, Califórnia.\n"),
                      TextSpan(
                        text: "Empresa: ",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      TextSpan(
                        text:
                            "Britney Spears Fragrances (em parceria com Elizabeth Arden).\n",
                      ),
                      TextSpan(
                        text: "Parceiros de Negócios: ",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      TextSpan(text: "Primary Wave e Gallery Books.\n"),
                      TextSpan(
                        text: "Foco Atual: ",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      TextSpan(
                        text:
                            "Autonomia criativa, novos projetos editoriais e expressão pessoal.",
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),

      bottomNavigationBar: Container(
        height: 70,
        color: darkMaroon,
        child: SafeArea(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                icon: const Icon(Icons.search, color: Colors.white, size: 30),
                onPressed: () {},
              ),
              IconButton(
                icon: const Icon(
                  Icons.home_outlined,
                  color: Colors.white,
                  size: 36,
                ),
                onPressed: () {},
              ),
              IconButton(
                icon: const Icon(
                  Icons.notifications_none,
                  color: Colors.white,
                  size: 30,
                ),
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
