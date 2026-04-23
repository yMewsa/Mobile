// Página de Formulário
// Tela com elementos de formulário para interação do user
// TextField, CheckBox, RadioButton, Slider, Switch -> Botão de Alternância, DropDown -> Menu Suspenso
// Form -> Ajuda na validação de dados

import 'package:flutter/material.dart';
import 'package:intro_interacao/widgets/bnb.dart';

// Chama as mudanças de estado
class FormPage extends StatefulWidget {
  const FormPage({super.key});

  @override
  State<FormPage> createState() => _FormPageState();
}

// Lógica de Construção da tela
class _FormPageState extends State<FormPage> {
  // Atributos
  String _nome = "";
  String _email = "";
  String _senha = "";
  String _confirmarSenha = "";
  bool _aceitarTermos = false; //Switch dos termos
  String _sexo = "Feminino"; //Radio (Feminino)
  double _idade = 18; //Slider -> Posição 18
  List<String> _interesses = [];
  String _cidade = "Americana";

  // Esconder senha
  bool _obscureSenha = true;
  bool _obscureConfirmarSenha = true;

  // Chave Global de Validação do Formulário
  final formKey =
      GlobalKey<FormState>(); // Só sera enviado se a chave for validada

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Formulário de Cadastro")),
      body: Padding(
        padding: EdgeInsets.all(8),
        // Adicionar elemento e fazer a verificação
        child: Form(
          key: formKey, // Chave de validação do formulário
          child: SingleChildScrollView(
            child: Column(
              children: [
                // Campo texto para nome
                TextFormField(
                  decoration: InputDecoration(
                    labelText: "Digite seu Nome",
                    border: OutlineInputBorder(),
                  ),
                  onChanged: (value) => setState(() {
                    _nome = value;
                  }),
                  // Operador ternário -> Valida se o campo esta vazio
                  validator: (value) =>
                      value!.isEmpty ? "Campo Obrigatório" : null,
                ),
                // Campo Email
                SizedBox(height: 20),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: "Digite seu email",
                    border: OutlineInputBorder(),
                  ),
                  onChanged: (value) => setState(() {
                    _email = value;
                  }),
                  // Verifica se o campo contem @
                  validator: (value) =>
                      value!.contains("@") ? null : "Email Inválido",
                ),
                // Campo Senha
                SizedBox(height: 20),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: "Digite sua Senha",
                    border: OutlineInputBorder(),
                    suffixIcon: IconButton(
                      onPressed: () => setState(() {
                        _obscureSenha = !_obscureSenha;
                      }),
                      icon: Icon(
                        _obscureSenha ? Icons.visibility_off : Icons.visibility,
                      ),
                    ),
                  ),
                  onChanged: (value) => setState(() {
                    _senha = value;
                  }),
                  validator: (value) => value!.length <= 6
                      ? "Senha deve ter no minimo 6 digitos"
                      : null,
                  obscureText: _obscureSenha,
                ),
                // Campo - Confirmar Senha
                SizedBox(height: 20),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: "Digite sua senha novamente",
                    border: OutlineInputBorder(),
                    suffixIcon: IconButton(
                      onPressed: () => setState(() {
                        _obscureConfirmarSenha = !_obscureConfirmarSenha;
                      }),
                      icon: Icon(
                        _obscureSenha ? Icons.visibility_off : Icons.visibility,
                      ),
                    ),
                  ),
                  onChanged: (value) => setState(() {
                    _confirmarSenha = value;
                  }),
                  validator: (value) =>
                      value! == _senha ? null : "Senha Diferente",
                  obscureText: _obscureConfirmarSenha,
                ),
                //  Radio Button (Apenas uma escolha)
                SizedBox(height: 20),
                // V3 - Não esta mais em uso
                /*Row(children: [
                  Text("Sexo: "),
                  SizedBox(width: 5,),
                  Radio(
                    value: "Feminino",
                    groupValue: _sexo,
                    onChanged: (value) => setState(()=> _sexo = value!),
                  ),

                  Text("Feminino"),
                  SizedBox(width: 5,),
                  Radio(
                    value: "Masculino",
                    groupValue: _sexo,
                    onChanged: (value) => setState(()=> _sexo = value!),
                  ),

                  Text("Masculino"),
                  SizedBox(width: 5,),
                  Radio(
                    value: "Outro",
                    groupValue: _sexo,
                    onChanged: (value) => setState(()=> _sexo = value!),
                  ),
                  Text("Outro"),
                ],) */

                // Radio Versão Nova
                // RadioGroup
                RadioGroup<String>(
                  groupValue: _sexo,
                  onChanged: (String? value) => setState(() => _sexo = value!),
                  child: Row(
                    children: [
                      Text("Sexo: "),
                      SizedBox(width: 5),
                      Radio(value: "Feminino"),
                      Text("Feminino"),
                      SizedBox(width: 5),
                      Radio(value: "Masculino"),
                      Text("Masculino"),
                      SizedBox(width: 5),
                      Radio(value: "Outro"),
                      Text("Outro"),
                      SizedBox(width: 5),
                    ],
                  ),
                ),
                // Slider -> Seleção de Idade
                SizedBox(height: 20),
                Row(
                  children: [
                    Text("Idade: ${_idade.toInt()}"), //Exibir idade selecionada
                    Expanded(
                      child: Slider(
                        value: _idade,
                        onChanged: (value) => setState(() => _idade = value),
                        min: 0,
                        max: 100,
                        divisions: 100,
                        label: _idade.toInt().toString(),
                      ),
                    ),
                  ],
                ),
                // CheckBox para Selecionar Interesses
                SizedBox(height: 20),
                Column(
                  children: [
                    Text("Interesses Pessoais: "),
                    Row(
                      children: [
                        Checkbox(
                          value: _interesses.contains("Cinema"),
                          onChanged: (bool? value) => setState(() {
                            value!
                                ? _interesses.add("Cinema")
                                : _interesses.remove("Cinema");
                          }),
                        ),
                        Text("Cinema"),
                        SizedBox(width: 5),
                        Checkbox(
                          value: _interesses.contains("Teatro"),
                          onChanged: (bool? value) => setState(() {
                            value!
                                ? _interesses.add("Teatro")
                                : _interesses.remove("Teatro");
                          }),
                        ),
                        Text("Teatro"),
                        SizedBox(width: 5),
                        Checkbox(
                          value: _interesses.contains("Esporte"),
                          onChanged: (bool? value) => setState(() {
                            value!
                                ? _interesses.add("Esporte")
                                : _interesses.remove("Esporte");
                          }),
                        ),
                        Text("Esporte"),
                        SizedBox(width: 5),
                      ],
                    ),
                    Row(
                      children: [
                        Checkbox(
                          value: _interesses.contains("Musica"),
                          onChanged: (bool? value) => setState(() {
                            value!
                                ? _interesses.add("Musica")
                                : _interesses.remove("Musica");
                          }),
                        ),
                        Text("Musica"),
                        SizedBox(width: 5),
                        Checkbox(
                          value: _interesses.contains("Viagem"),
                          onChanged: (bool? value) => setState(() {
                            value!
                                ? _interesses.add("Viagem")
                                : _interesses.remove("Viagem");
                          }),
                        ),
                        Text("Viagem"),
                        SizedBox(width: 5),
                        Checkbox(
                          value: _interesses.contains("VideoGame"),
                          onChanged: (bool? value) => setState(() {
                            value!
                                ? _interesses.add("VideoGame")
                                : _interesses.remove("VideoGame");
                          }),
                        ),
                        Text("VideoGame"),
                        SizedBox(width: 5),
                      ],
                    ),
                  ],
                ),
                // Dropdown Cidades - Lista suspensa
                SizedBox(height: 20),
                Text("Cidade"),
                DropdownButtonFormField(
                  // Cria uma borda na caixa de Dropdown
                  decoration: InputDecoration(border: OutlineInputBorder()),
                  items: [
                    DropdownMenuItem(
                      child: Text("Americana"),
                      value: "Americana",
                    ),
                    DropdownMenuItem(
                      child: Text("Campinas"),
                      value: "Campinas",
                    ),
                    DropdownMenuItem(child: Text("Sumaré"), value: "Sumaré"),
                    DropdownMenuItem(
                      child: Text("Nova Odessa"),
                      value: "Nova Odessa",
                    ),
                    DropdownMenuItem(
                      child: Text("Santa Bárbara do'Oeste"),
                      value: "Santa Bárbara d'Oeste",
                    ),
                    DropdownMenuItem(
                      child: Text("Paulinia"),
                      value: "Paulinia",
                    ),
                    DropdownMenuItem(child: Text("Outra"), value: "Outra"),
                  ],
                  onChanged: (value) => setState(() => _cidade = value!),
                ),
                // Switch - Termos de Uso
                SizedBox(height: 20),
                Switch(
                  value: _aceitarTermos,
                  onChanged: (bool value) =>
                      setState(() => _aceitarTermos = value),
                ),
                Text("Aceitar os Termos de Uso"),
                // Botão de Envio do Formulário
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () => _enviarFormulario(),
                  child: Text("Enviar Formulário"),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Bnb(context),
    );
  }

  void _enviarFormulario() {
    // Verifica aceitação dos termos (validação)
    // AlertDialog (model de alerta)
    if (formKey.currentState!.validate() && _aceitarTermos) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text("Dados do Formulário"),
          content: SingleChildScrollView(
            child: ListBody(
              children: [
                Text("Nome: $_nome"),
                Text("Email: $_email"),
                Text("Senha: $_senha"),
                Text("Sexo: $_sexo"),
                Text("Idade: ${_idade.toInt()}"),
                Text("Interesses: ${_interesses.join(", ")}"),
                Text("Cidade: $_cidade"),
              ],
            ),
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                //Sem arrow function para fazer várias ações
                //Limpa as respostas
                setState(() {
                  _nome = "";
                  _email = "";
                  _senha = "";
                  _confirmarSenha = "";
                  _sexo = "Feminino";
                  _idade = 18;
                  _interesses = [];
                  _cidade = "Americana";
                  _aceitarTermos = false;
                  formKey.currentState!
                      .reset(); //reseta a validação do formulário
                });
                Navigator.popAndPushNamed(context, "/");
              },
              child: Text("Ok"),
            ),
          ],
        ),
      );
    }
  }
}
