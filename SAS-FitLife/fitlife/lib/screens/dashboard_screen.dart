import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/atividades_provider.dart';
import '../providers/usuario_provider.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final atividadesProvider = Provider.of<AtividadesProvider>(context);
    final usuarioProvider = Provider.of<UsuarioProvider>(context);
    final concluidas = atividadesProvider.concluidas.length;
    final calorias = concluidas * 64;
    final tempo = Duration(minutes: concluidas * 30);
    final meta = usuarioProvider.metaSemanal;
    final metaPercent = meta == 0
        ? 0
        : (concluidas / meta * 100).clamp(0, 100).toInt();

    return Scaffold(
      appBar: AppBar(title: const Text('FitLife')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Análise de Progresso',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            const SizedBox(height: 12),
            Card(
              child: ListTile(
                title: const Text('Atividades Concluídas'),
                trailing: Text('$concluidas'),
              ),
            ),
            Card(
              child: ListTile(
                title: const Text('Calorias'),
                trailing: Text('$calorias kcal'),
              ),
            ),
            Card(
              child: ListTile(
                title: const Text('Tempo Total'),
                trailing: Text('${tempo.inHours}h${tempo.inMinutes % 60}'),
              ),
            ),
            Card(
              child: ListTile(
                title: const Text('Meta Semanal'),
                trailing: Text('$metaPercent%'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
