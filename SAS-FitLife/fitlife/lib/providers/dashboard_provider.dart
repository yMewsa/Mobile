import 'package:flutter/material.dart';
import 'atividades_provider.dart';

class DashboardProvider extends ChangeNotifier {
  int get atividadesConcluidas => _atividadesProvider?.concluidas.length ?? 0;
  int get calorias =>
      atividadesConcluidas * 64; // Exemplo: 64 kcal por atividade
  Duration get tempoTotal =>
      Duration(minutes: atividadesConcluidas * 30); // 30 min por atividade
  double get metaPercentual =>
      _usuarioProvider == null || _usuarioProvider!.metaSemanal == 0
      ? 0
      : (atividadesConcluidas / _usuarioProvider!.metaSemanal)
            .clamp(0, 1)
            .toDouble();

  AtividadesProvider? _atividadesProvider;
  dynamic _usuarioProvider;

  void updateProviders(AtividadesProvider atividades, dynamic usuario) {
    _atividadesProvider = atividades;
    _usuarioProvider = usuario;
    notifyListeners();
  }
}
