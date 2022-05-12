// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, unnecessary_import, prefer_const_literals_to_create_immutables, unused_local_variable, unused_element, avoid_print, unused_import
// ignore: avoid_web_libraries_in_flutter
import 'dart:html';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/resultado.dart';
import './resultado.dart';
import './questionario.dart';

//todos elementos de estado vão ser configurados nessa classe
//para toda mudança que acontecer seja feita instantaneamento no visual
class PerguntaAppState extends State<PerguntasApp> {
  var perguntasselecionadas = 0;
  var notaTotal = 0;

  void responder(int nota) {
    if (temPerguntaSelecionada) {
      //para passar o que está sendo modificado internamente para a graficamente
      setState(() {
        perguntasselecionadas++;
        notaTotal = nota + notaTotal;
      });
      print("Pergunta respondida!");
    }
  }

  void reiniciarQuestionario() {
    setState(() {
      perguntasselecionadas = 0;
      notaTotal = 0;
    });
  }

  final List<Map<String, Object>> perguntas = [
    {
      'texto': "Qual a sua cor favorita?",
      'respostas': [
        {'texto': 'Preto', 'nota': 10},
        {'texto': 'Amarelo', 'nota': 5},
        {'texto': 'Verde', 'nota': 3},
        {'texto': 'Vermelho', 'nota': 1},
      ],
    },
    {
      'texto': "Qual o seu animal favorito?",
      'respostas': [
        {'texto': 'Gato', 'nota': 5},
        {'texto': 'Cachorro', 'nota': 1},
        {'texto': 'Calopsita', 'nota': 10},
        {'texto': 'Elefante', 'nota': 3},
      ],
    },
    {
      'texto': "Qual o seu instrutor favorito?",
      'respostas': [
        {'texto': 'Pedro', 'nota': 10},
        {'texto': 'João', 'nota': 3},
        {'texto': 'Maria', 'nota': 5},
        {'texto': 'Ana', 'nota': 1},
      ],
    },
  ];

  bool get temPerguntaSelecionada {
    return perguntasselecionadas < perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    //cada componente tem um contexto
    // Widget é a raiz na aplicação
    return MaterialApp(
      // estrutura da aplicação
      home: Scaffold(
          //appBar tem o um componente que chama-se AppBar
          appBar: AppBar(
            title: Text('Perguntas'),
          ),
          body: temPerguntaSelecionada
              ? Questionario(
                  perguntas: perguntas,
                  perguntasselecionadas: perguntasselecionadas,
                  responderCorreto: responder)
              : Resultado(notaTotal, reiniciarQuestionario)),
    );
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


// //o botao recebe um componente filho que é outro Widget
              // //responder sem os () você está chamando a função para executar
              // // ignore: deprecated_member_use
              // RaisedButton(
              //   child: Text("Resposta 1"),
              //   onPressed: responder,
              // ),
              // // ignore: deprecated_member_use
              // RaisedButton(
              //   child: Text("Resposta 2"),
              //   onPressed: responder,
              // ),
              // // ignore: deprecated_member_use
              // RaisedButton(
              //   child: Text("Resposta 3"),
              //   onPressed: responder,
              // )