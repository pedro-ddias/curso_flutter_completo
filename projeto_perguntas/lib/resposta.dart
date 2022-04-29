// ignore_for_file: use_key_in_widget_constructors, deprecated_member_use, prefer_const_constructors, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';

class Resposta extends StatelessWidget {
  final String texto;

  Resposta(this.texto);

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      child: Text(texto),
      onPressed: null,
    );
  }
}
