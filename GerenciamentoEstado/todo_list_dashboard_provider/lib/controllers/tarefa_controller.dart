// Controller vai ter a função de provider
import 'package:flutter/material.dart';
import 'package:todo_list_dashboard_provider/models/tarefa.dart';

class TarefaController extends ChangeNotifier {
  // Classe controller -> Herdeira da changeNotifier
  // Classe que vai armazenar tarefas
  List<Tarefa> _tarefas = [];

  // Liberar o Acesso (getter) -> READ
  List<Tarefa> get tarefas => _tarefas;

  // Métodos (CRUD)
  // CREATE
  void createTarefa(String titulo) {
    if (titulo.trim().isEmpty) return; //Não permite se estiver nulo
    _tarefas.add(Tarefa(titulo: titulo)); //+ Obj de tarefa
    notifyListeners(); //Notifica o listener que foi acionado
  }

  // UPDATE
  void updateTarefa(int index) {
    _tarefas[index].concluida = !_tarefas[index].concluida;
    // Inverte o valo da bool
  }

  // DELETE
  void deleteTarefa(int index) {
    _tarefas.removeAt(index);
    notifyListeners();
  }

  // Criar métodos para definição das métricas
  // TotalTarefas
  int get totalTarefas => _tarefas.length;

  // Total Tarefas Concluidas
  int get totalTarefasConcluidas =>
      _tarefas.where((tarefa) => tarefa.concluida).length;

  // Total Tarefas Pendentes
  int get totalTarefasPendentes =>
      _tarefas.where((tarefa) => !tarefa.concluida).length;

  // Porcentagem Tarefas Concluidas
  double get porcentagemTarefasConcluidas {
    if (totalTarefas == 0) return 0;
    return totalTarefasConcluidas / totalTarefas * 100;
  }
}
