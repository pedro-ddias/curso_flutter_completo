// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, sized_box_for_whitespace, avoid_unnecessary_containers, deprecated_member_use, avoid_print, unused_import, unused_element

import 'package:despesas/components/transection_form.dart';
import 'package:flutter/material.dart';

import 'package:intl/intl.dart';
import 'components/transection_form.dart';
import 'components/transection_list.dart';
import 'models/transection.dart';
import 'dart:math';

main() => runApp(DespesasApp());

class DespesasApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _transections = [
    transection(
        date: DateTime.now(), id: 't1', title: 'Tenis Novo', value: 310.99),
    transection(
        date: DateTime.now(), id: 't2', title: 'Conta Luz', value: 250.11),
  ];

  _addTransection(String title, double value) {
    final newTransection = transection(
        date: DateTime.now(),
        id: Random().nextDouble().toString(),
        title: title,
        value: value);

    setState(() {
      _transections.add(newTransection);
    });
  }

  _openTransectionFormModal(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (_) {
          return TransectionForm(_addTransection);
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Despesas Pessoais'),
        // ignore: prefer_const_literals_to_create_immutables
        actions: [
          //botao de adcionar no AppBar
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () => _openTransectionFormModal(context),
          )
        ],
      ),
      // para de rolagem para aparecer todos documentos na tela
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
              TransectionList(_transections),
            ]),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => _openTransectionFormModal(context),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
