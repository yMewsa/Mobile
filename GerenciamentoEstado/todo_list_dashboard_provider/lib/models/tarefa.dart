class Tarefa {
  // Atributos
  String titulo; //Titulo
  bool concluida; //Status
  DateTime criadaEm; //Data da Tarefa

  Tarefa({required this.titulo, this.concluida = false, DateTime? criadaEm})
    : criadaEm = criadaEm ?? DateTime.now();
    // Se ao criar não existir (??) um carimbo de data e hora é criado
}
