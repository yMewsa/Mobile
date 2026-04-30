import 'package:flutter/material.dart';

class Atividade {
  final String nome;
  bool concluida;
  Atividade(this.nome, {this.concluida = false});
}

class AtividadesProvider extends ChangeNotifier {
  final List<Atividade> _pendentes = [
    Atividade('Caminhada'),
    Atividade('Corrida'),
    Atividade('Treino de musculação'),
    Atividade('Alongamento'),
    Atividade('Yoga'),
  ];
  final List<Atividade> _concluidas = [];

  List<Atividade> get pendentes => List.unmodifiable(_pendentes);
  List<Atividade> get concluidas => List.unmodifiable(_concluidas);

  void concluirAtividade(Atividade atividade) {
    _pendentes.remove(atividade);
    atividade.concluida = true;
    _concluidas.add(atividade);
    notifyListeners();
  }

  void adicionarAtividade(String nome) {
    _pendentes.add(Atividade(nome));
    notifyListeners();
  }

  void removerAtividade(Atividade atividade) {
    _pendentes.remove(atividade);
    notifyListeners();
  }

  void removerAtividadeConcluida(Atividade atividade) {
    _concluidas.remove(atividade);
    notifyListeners();
  }

  void resetarAtividades() {
    _pendentes.clear();
    _pendentes.addAll([
      Atividade('Caminhada'),
      Atividade('Corrida'),
      Atividade('Treino de musculação'),
      Atividade('Alongamento'),
      Atividade('Yoga'),
    ]);
    _concluidas.clear();
    notifyListeners();
  }
}
