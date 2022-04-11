import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// porta de entrada do programa para passarmos primeiro Widget
void main(List<String> args) {
  runApp(new PerguntasApp());
}

//faz com que possamos criar a Widget, por isso extendemos essa classe
//a partir disso já importou o nosso componente
class PerguntasApp extends StatelessWidget {
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: Text('Ola Flutter'),
    );
  }
}
