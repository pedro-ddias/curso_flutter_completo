import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// porta de entrada do programa para passarmos primeiro Widget
void main(List<String> args) {
  runApp(PerguntasApp());
}

//faz com que possamos criar a Widget, por isso extendemos essa classe
//a partir disso já importou o nosso componente
class PerguntasApp extends StatelessWidget {
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
      body: Text('Ola flutter, qual seu nome?'),
    ));
  }
}
