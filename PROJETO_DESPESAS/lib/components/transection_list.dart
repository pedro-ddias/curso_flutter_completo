// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors_in_immutables, prefer_const_constructors, unused_import, avoid_unnecessary_containers, sized_box_for_whitespace
import 'package:flutter/material.dart';
import 'package:despesas/models/transection.dart';
import "package:intl/intl.dart";

class TransectionList extends StatelessWidget {
  final List<transection> transections;

  TransectionList(this.transections);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      // para renderizar na tela a quantidade visivel
      child: ListView.builder(
        itemCount: transections.length,
        itemBuilder: (ctx, index) {
          final tr = transections[index];
          return Card(
              child: Row(
            children: <Widget>[
              Container(
                margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.purple,
                    width: 3,
                  ),
                ),
                padding: EdgeInsets.all(10),
                child: Text(
                  'R\$ ${tr.value.toStringAsFixed(2)}',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.purple,
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    tr.title,
                    style: TextStyle(
                      fontFamily: 'OpenSans',
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    DateFormat('d/MM/y').format(tr.date),
                    style: TextStyle(
                      color: Color.fromARGB(255, 103, 103, 103),
                    ),
                  )
                ],
              )
            ],
          ));
        },
      ),
    );
  }
}
