import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list_dashboard_provider/controllers/tarefa_controller.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Dashboard de Tarefas"), centerTitle: true),
      body: Padding(
        padding: EdgeInsets.all(8),
        child: Consumer<TarefaController>(
          builder: (context, controller, child) {
            return Column(children: [
              // Lista de Card -> TotalTarefas, TotalTarefasConcluidas, TotalTarefasPendentes, PorcentagemTarefasConcluídas
              _cardDashboard(
                titulo: "Total de Tarefas", 
                value: controller.totalTarefas.toString(), 
                icon: Icons.list_alt, 
                color: Colors.blue),

                _cardDashboard(titulo: "Total de Tarefas concluídas", 
                value: controller.totalTarefasConcluidas.toString(), 
                icon: Icons.check_box, 
                color: Colors.green),

                _cardDashboard(titulo: "Total Tarefas Pendentes", 
                value: controller.totalTarefasPendentes.toString(), 
                icon: Icons.pending_actions, 
                color: Colors.orange),

                _cardDashboard(titulo: "Porcentagem de Tarefas Concluídas", 
                value: controller.porcentagemTarefasConcluidas.toString(), 
                icon: Icons.percent, 
                color: Colors.purple)
              ],
            );
          },
        ),
      ),
    );
  }
}

Widget _cardDashboard({
  required String titulo,
  required String value,
  required IconData icon,
  required Color color,
}){
  return Card(
    elevation: 4,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadiusGeometry.circular(12)
    ),
    child: ListTile(
      leading: CircleAvatar(
        backgroundColor: color.withValues(alpha: 0.15),
        child: Icon(icon, color: color,),
      ),
      title: Text(titulo, style: TextStyle(fontSize: 24,),),
      trailing: Text(value, style: TextStyle(fontSize: 24, color: color),),
    ),
  );
}