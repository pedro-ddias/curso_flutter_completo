// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, unnecessary_import, prefer_const_literals_to_create_immutables, unused_local_variable, unused_element, avoid_print, unused_import
// ignore: avoid_web_libraries_in_flutter
import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import './questao.dart';

//todos elementos de estado vão ser configurados nessa classe
//para toda mudança que acontecer seja feita instantaneamento no visual
class PerguntaAppState extends State<PerguntasApp> {
  var perguntasselecionadas = 0;

  void responder() {
    //para passar o que está sendo modificado internamente para a graficamente
    setState(() {
      perguntasselecionadas++;
    });
    print("Pergunta respondida!");
  }

  @override
  Widget build(BuildContext context) {
    final List<String> perguntas = [
      "Qual a sua cor favorita?",
      "Qual o seu animal favorito?"
    ];

    //cada componente tem um contexto
    // Widget é a raiz na aplicação
    return MaterialApp(
        // estrutura da aplicação
        home: Scaffold(
            //appBar tem o um componente que chama-se AppBar
            appBar: AppBar(
              title: Text('Perguntas'),
            ),
            body: Column(children: [
              //pergando a pergunta da posição 0 que criamos na lista no inicio do projeto
              Questao(perguntas[perguntasselecionadas]),
              //o botao recebe um componente filho que é outro Widget
              //responder sem os () você está chamando a função para executar
              // ignore: deprecated_member_use
              RaisedButton(
                child: Text("Resposta 1"),
                onPressed: responder,
              ),
              // ignore: deprecated_member_use
              RaisedButton(
                child: Text("Resposta 2"),
                onPressed: responder,
              ),
              // ignore: deprecated_member_use
              RaisedButton(
                child: Text("Resposta 3"),
                onPressed: responder,
              )
            ])));
  }
}

// porta de entrada do programa para passarmos primeiro Widget
void main(List<String> args) {
  runApp(PerguntasApp());
}

//faz com que possamos criar a Widget, por isso extendemos essa classe
//a partir disso já importou o nosso componente
class PerguntasApp extends StatefulWidget {
  @override
  State<PerguntasApp> createState() {
    return PerguntaAppState();
  }
}
