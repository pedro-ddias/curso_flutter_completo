// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors_in_immutables, prefer_const_constructors, unused_import, avoid_unnecessary_containers, sized_box_for_whitespace, unnecessary_string_escapes
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
      // irá rodar a lista caso haja elemento, se não roda a coluna
      // para renderizar na tela a quantidade visivel
      child: transections.isEmpty
          ? Column(
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                SizedBox(height: 20),
                Text(
                  'Nenhuma transação Cadastrada',
                  style: TextStyle(
                    fontFamily: 'OpenSans',
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  height: 200,
                  child: Image.asset(
                    'assets\images\waiting.jpeg',
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            )
          : ListView.builder(
              itemCount: transections.length,
              itemBuilder: (ctx, index) {
                final tr = transections[index];
                return Card(
                    child: Row(
                  children: <Widget>[
                    Container(
                      margin:
                          EdgeInsets.symmetric(horizontal: 15, vertical: 10),
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
