// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, sized_box_for_whitespace, avoid_unnecessary_containers, deprecated_member_use, avoid_print, unused_import

import 'package:flutter/material.dart';
import 'components/transection_user.dart';

main() => runApp(DespesasApp());

class DespesasApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Despesas Pessoais'),
        ),
        body: SingleChildScrollView(
          child: Column(
              // ignore: prefer_const_literals_to_create_immutables
              children: <Widget>[
                Container(
                  width: double.infinity,
                  child: Card(
                    child: Text('Gráfico'),
                  ),
                ),
                TransectionUser(),
              ]),
        ));
  }
}
