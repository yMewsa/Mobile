import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list_dashboard_provider/controllers/tarefa_controller.dart';
import 'package:todo_list_dashboard_provider/views/home_page.dart';

void main(List<String> args) {
  runApp(ChangeNotifierProvider(
    create: (context) => TarefaController(),
    child: MaterialApp(
      home: TarefaView(),
    ),
  ));
}
