// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, sized_box_for_whitespace, duplicate_ignore, deprecated_member_use, unused_local_variable, unused_element, avoid_unnecessary_containers

import 'package:despesas/components/chart.dart';
import 'package:flutter/material.dart';
import 'dart:math';
import './components/transection_form.dart';
import './components/transection_list.dart';
import 'models/transection.dart';
import 'components/chart.dart';

main() => runApp(ExpensesApp());

class ExpensesApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
      theme: ThemeData(
          primarySwatch: Colors.purple,
          accentColor: Colors.purple,
          fontFamily: 'Quicksand',
          appBarTheme: AppBarTheme(
              textTheme: ThemeData.light().textTheme.copyWith(
                  headline6: TextStyle(
                      fontFamily: 'OpenSans',
                      fontSize: 20,
                      fontWeight: FontWeight.bold)))),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<transection> _transactions = [
    transection(
      id: 't1',
      title: 'Novo Tênis de Corrida',
      value: 310.76,
      date: DateTime.now().subtract(Duration(days: 3)),
    ),
    transection(
      id: 't2',
      title: 'Conta de Luz',
      value: 210.30,
      date: DateTime.now().subtract(Duration(days: 4)),
    ),
    transection(
      id: 't3',
      title: 'Conta de Internet',
      value: 110.00,
      date: DateTime.now().subtract(Duration(days: 5)),
    ),
    transection(
      id: 't4',
      title: 'Conta de Água',
      value: 80.00,
      date: DateTime.now().subtract(Duration(days: 6)),
    ),
    transection(
      id: 't5',
      title: 'Lanche Shopping',
      value: 50.00,
      date: DateTime.now(),
    ),
  ];

  List<transection> get _recentTransection {
    //recebe o elemento como padrão
    //mostrar apenas as ultimas transações dos últimos 7 dias
    return _transactions.where((tr) {
      //se a data for de uma data substituida a 7 dias atras
      return tr.date.isAfter(DateTime.now().subtract(
        Duration(days: 7),
      ));
    }).toList();
  }

  _addTransaction(String title, double value) {
    final newTransaction = transection(
      id: Random().nextDouble().toString(),
      title: title,
      value: value,
      date: DateTime.now(),
    );

    setState(() {
      _transactions.add(newTransaction);
    });

    Navigator.of(context).pop();
  }

  _openTransactionFormModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (_) {
        return TransectionForm(_addTransaction);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Despesas Pessoais',
          style: TextStyle(
            fontFamily: 'OpenSans',
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () => _openTransactionFormModal(context),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Chart(_recentTransection),
            TransectionList(_transactions),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.add,
        ),
        onPressed: () => _openTransactionFormModal(context),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
