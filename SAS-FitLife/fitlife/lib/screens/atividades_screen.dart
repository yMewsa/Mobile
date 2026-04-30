import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:fitlife/providers/atividades_provider.dart';

// Importe o seu provider aqui, por exemplo:
// import 'meu_provider.dart'; 

class AtividadesScreen extends StatefulWidget {
  const AtividadesScreen({super.key});

  @override
  State<AtividadesScreen> createState() => _AtividadesScreenState();
}

class _AtividadesScreenState extends State<AtividadesScreen> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.grey[200],
        elevation: 0,
        title: Row(
          children: [
            CircleAvatar(backgroundColor: Colors.grey[400], radius: 16),
            const SizedBox(width: 12),
            const Text('FitLife', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Campo de adicionar tarefa
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(24),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: _controller,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Digite a nova Tarefa...',
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        final nome = _controller.text.trim();
                        if (nome.isNotEmpty) {
                          context.read<AtividadesProvider>().adicionarAtividade(nome);
                          _controller.clear();
                        }
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.grey[400],
                          shape: BoxShape.circle,
                        ),
                        padding: const EdgeInsets.all(8),
                        child: const Icon(Icons.add, color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              // Atividades Pendentes
              const Text('Atividades Pendentes', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
              const SizedBox(height: 8),
              const _AtividadesCard(pendentes: true),
              const SizedBox(height: 20),
              // Atividades Concluídas
              const Text('Atividades Concluídas', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
              const SizedBox(height: 8),
              const _AtividadesCard(pendentes: false),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.list), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.bar_chart), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: ''),
        ],
        currentIndex: 0,
        onTap: (i) {},
      ),
    );
  }
}

// CORREÇÃO: Criação correta da classe _AtividadesCard
class _AtividadesCard extends StatelessWidget {
  final bool pendentes;
  
  const _AtividadesCard({super.key, required this.pendentes});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<AtividadesProvider>();
    final atividades = pendentes ? provider.pendentes : provider.concluidas;
    
    if (atividades.isEmpty) {
      return Container(
        width: double.infinity,
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          pendentes ? 'Nenhuma atividade pendente.' : 'Nenhuma atividade concluída.',
          style: const TextStyle(color: Colors.grey),
        ),
      );
    }
    
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(20),
      ),
      child: ListView.separated(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: atividades.length,
        separatorBuilder: (_, __) => const Divider(height: 1, color: Colors.transparent),
        itemBuilder: (context, i) {
          final atividade = atividades[i];
          return ListTile(
            title: Text(atividade.nome),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (pendentes)
                  IconButton(
                    icon: const Icon(Icons.check_circle_outline, color: Colors.green),
                    onPressed: () {
                      provider.concluirAtividade(atividade);
                    },
                  ),
                IconButton(
                  icon: const Icon(Icons.delete_outline, color: Colors.red),
                  onPressed: () {
                    if (pendentes) {
                      provider.removerAtividade(atividade);
                    } else {
                      provider.removerAtividadeConcluida(atividade);
                    }
                  },
                ),
              ],
            ),
            leading: !pendentes ? const Icon(Icons.check, color: Colors.green) : null,
          );
        },
      ),
    );
  }
}