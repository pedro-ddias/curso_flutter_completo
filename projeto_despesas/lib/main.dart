// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, sized_box_for_whitespace
import 'package:despesas/models/transection.dart';
import 'package:flutter/material.dart';

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
  final _transections = [
    transection(
        date: DateTime.now(), id: 't1', title: 'Tenis Novo', value: 310.99),
    transection(
        date: DateTime.now(), id: 't2', title: 'Conta Luz', value: 250.11),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Despesas Pessoais'),
        ),
        body: Column(
            // ignore: prefer_const_literals_to_create_immutables
            children: <Widget>[
              Container(
                width: double.infinity,
                child: Card(
                  child: Text('Gráfico'),
                ),
              ),
              Column(
                // ignore: prefer_const_literals_to_create_immutables
                children: _transections.map((tr) {
                  return Card(
                    child: Text(tr.title),
                  );
                }).toList(),
              )
            ]));
  }
}
