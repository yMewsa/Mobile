import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(MaterialApp(debugShowCheckedModeBanner: false, home: TodoListView()));
}

// Classe - Janela StateFul
// Primeira classe: identiifica as mudanças de estado e chama o rebuild
class TodoListView extends StatefulWidget {
  const TodoListView({super.key});

  //Chama o rebuild
  @override
  State<TodoListView> createState() => _TodoListViewState();
}

// Segunda Classe: lógica da tela (atributos/métodos)
class _TodoListViewState extends State<TodoListView> {
  // Atributos
  // Obj. para controlar input(entrada de dados)
  // Imutavel depois da primeira mudança (unica mudança -> vira uma const)
  // _ -> Para transforamar a variavel em privada (só pode ser acessada pela class)
  final TextEditingController _tarefasController = TextEditingController();
  // Map -> Não ordenado -> Organizada atraves de key e value (chave e valor)
  // Lista de Coleções -> [{}, {}, {}]
  final List<Map<String, dynamic>> _tarefas = [];

  // Métodos

  // Build -> Lógica por tras da Janela
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Lista de Tarefas"), centerTitle: true),
      body: Padding(
        // Espaçamento geral - 8px
        padding: EdgeInsets.all(8),
        child: Column(
          children: [
            // Lista de Elementos - pode adicionar + de 1 tarefa
            // Input da Tarefa
            TextField(
              controller: _tarefasController,
              decoration: InputDecoration(labelText: "Digite uma Tarefa"),
            ),
            // Espaçamento
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _adicionarTarefa,
              child: Text("Adicionar Tarefa"),
            ),
            // Listar as tarefas da lista
            // Scroll de parte da tela
            Expanded(
              child: ListView.builder(
                itemCount:
                    _tarefas.length, //Contagem de quantas tarefas vão ter
                itemBuilder: (context, index) =>
                    // Para cada elemento faã -> ForEach
                    ListTile(
                      title: Text(
                        _tarefas[index]["titulo"],
                        style: TextStyle(
                          decoration: _tarefas[index]["concluida"]
                              ? TextDecoration.lineThrough
                              : null,
                        ),
                      ),
                      // CheckBox -> Conclusão da tarefa
                      leading: Checkbox(
                        value: _tarefas[index]["concluida"],
                        onChanged: (bool? valor) => setState(() {
                          _tarefas[index]["concluida"] =
                              valor!; //Inverte o valor da chave -> de false para true
                        }),
                      ),
                      // Adicionar icone para deletar tarefa (IconButton // ElevatedButton)
                      trailing: IconButton(
                        onPressed: () => _deletarTarefa(index),
                        icon: Icon(Icons.delete),
                      ),
                    ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Método para adicionar tarefa
  void _adicionarTarefa() {
    // Trim -> Tira os espaços em branco antes e depois do texto
    if (_tarefasController.text.trim().isNotEmpty) {
      // Se tarefa não estiver vazia
      // Adicionar a tarefa a lista
      // Mudar o estado da janela
      setState(() {
        // Envia um aviso da mudança de estado
        _tarefas.add({
          "titulo": _tarefasController.text.trim(),
          "concluida": false,
        });
      });
    }
  }

  // Método para deletar Tarefa
  void _deletarTarefa(int index) {
    if (_tarefas[index]["concluida"] == true) {
      setState(() {
        _tarefas.remove((_tarefas[index]));
      });
    }
  }
}
