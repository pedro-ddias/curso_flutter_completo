// ignore_for_file: empty_constructor_bodies, use_key_in_widget_constructors, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import './questao.dart';
import './resposta.dart';

class Questionario extends StatelessWidget {
  final List<Map<String, Object>> perguntas;
  final int perguntasselecionadas;
  final void Function() responder;

  Questionario({
    required this.perguntas,
    required this.perguntasselecionadas,
    required this.responder,
  });

  bool get temPerguntaSelecionada {
    return perguntasselecionadas < perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    List<String> respostas = temPerguntaSelecionada
        ? perguntas[perguntasselecionadas].cast()['respostas']
        : [];

    return Column(children: <Widget>[
      //pergando a pergunta da posição 0 que criamos na lista no inicio do projeto
      Questao(perguntas[perguntasselecionadas]['texto'].toString()),
      ...respostas.map((t) => Resposta(t, responder)).toList(),
    ]);
  }
}
