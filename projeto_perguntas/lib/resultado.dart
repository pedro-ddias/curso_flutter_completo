// ignore_for_file: prefer_const_constructors, prefer_const_constructors_in_immutables, use_key_in_widget_constructors, deprecated_member_use

import 'package:flutter/material.dart';

class Resultado extends StatelessWidget {
  final int nota;
  final void Function() quandoReiniciarQuestionario;

  Resultado(this.nota, this.quandoReiniciarQuestionario);

  String get fraseResultado {
    if (nota < 8) {
      return 'Parabens!!';
    } else if (nota < 12) {
      return 'Você é bom';
    } else if (nota < 16) {
      return 'Impressionante';
    } else {
      return 'Nivel top!';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Text(
            fraseResultado,
            style: TextStyle(fontSize: 28),
          ),
        ),
        FlatButton(
          child: Text('Reiniar', style: TextStyle(fontSize: 20)),
          textColor: Colors.blue,
          onPressed: quandoReiniciarQuestionario,
        )
      ],
    );
  }
}
