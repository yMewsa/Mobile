import 'package:flutter/material.dart';

class UsuarioProvider extends ChangeNotifier {
  String _nome = '';
  int _metaSemanal = 5;

  String get nome => _nome;
  int get metaSemanal => _metaSemanal;

  void setNome(String nome) {
    _nome = nome;
    notifyListeners();
  }

  void setMetaSemanal(int meta) {
    _metaSemanal = meta;
    notifyListeners();
  }

  void resetarUsuario() {
    _nome = '';
    _metaSemanal = 5;
    notifyListeners();
  }
}
