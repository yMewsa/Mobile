import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/usuario_provider.dart';
import '../providers/atividades_provider.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final usuarioProvider = Provider.of<UsuarioProvider>(context);
    final nomeController = TextEditingController(text: usuarioProvider.nome);
    final metaController = TextEditingController(
      text: usuarioProvider.metaSemanal.toString(),
    );

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.green[200],
        elevation: 0,
        title: Row(
          children: [
            const SizedBox(width: 12),
            const Text(
              'FitLife',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const CircleAvatar(radius: 32, backgroundColor: Colors.grey),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        usuarioProvider.nome.isEmpty
                            ? 'Nome de Usuário'
                            : usuarioProvider.nome,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                              title: const Text('Alterar nome de usuário'),
                              content: TextField(
                                controller: nomeController,
                                decoration: const InputDecoration(
                                  hintText: 'Novo nome',
                                ),
                              ),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    usuarioProvider.setNome(
                                      nomeController.text,
                                    );
                                    Navigator.pop(context);
                                  },
                                  child: const Text('Salvar'),
                                ),
                              ],
                            ),
                          );
                        },
                        child: const Text('Alterar nome de usuário'),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
            Row(
              children: [
                const Text('Meta semanal:'),
                const SizedBox(width: 8),
                Expanded(
                  child: TextField(
                    controller: metaController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(hintText: 'Meta'),
                    onSubmitted: (value) {
                      final meta = int.tryParse(value) ?? 5;
                      usuarioProvider.setMetaSemanal(meta);
                    },
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    final meta = int.tryParse(metaController.text) ?? 5;
                    usuarioProvider.setMetaSemanal(meta);
                  },
                  child: const Text('Salvar'),
                ),
              ],
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                usuarioProvider.resetarUsuario();
                context.read<AtividadesProvider>().resetarAtividades();
              },
              child: const Text('Redefinir dados'),
            ),
          ],
        ),
      ),
    );
  }
}
