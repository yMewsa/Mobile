import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/usuario_provider.dart';
import 'main_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final TextEditingController _controller = TextEditingController();

  void _startApp() {
    if (_controller.text.trim().isNotEmpty) {
      Provider.of<UsuarioProvider>(
        context,
        listen: false,
      ).setNome(_controller.text.trim());
      Navigator.of(
        context,
      ).pushReplacement(MaterialPageRoute(builder: (_) => const MainScreen()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const CircleAvatar(radius: 36, backgroundColor: Colors.grey),
              const SizedBox(height: 24),
              const Text(
                'FitLife',
                style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              const Text(
                'O melhor para sua saúde',
                style: TextStyle(fontSize: 18),
              ),
              const SizedBox(height: 24),
              const Text('Para começar, digite seu nome:'),
              const SizedBox(height: 8),
              TextField(
                controller: _controller,
                decoration: const InputDecoration(
                  hintText: 'Nome...',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                ),
              ),
              const SizedBox(height: 12),
              ElevatedButton(
                onPressed: _startApp,
                child: const Text('Começar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
