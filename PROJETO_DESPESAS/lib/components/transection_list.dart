// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors_in_immutables, prefer_const_constructors, unused_import, avoid_unnecessary_containers, sized_box_for_whitespace, unnecessary_string_escapes
import 'package:flutter/material.dart';
import 'package:despesas/models/transection.dart';
import "package:intl/intl.dart";

class TransectionList extends StatelessWidget {
  final List<transection> transections;
  final void Function(String) onRemove;

  TransectionList(this.transections, this.onRemove);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 620,
      // irá rodar a lista caso haja elemento, se não roda a coluna
      // para renderizar na tela a quantidade visivel
      child: transections.isEmpty
          ? Column(
              // ignore: prefer_const_literals_to_create_immutables
              children: <Widget>[
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
                    'assets/images/waiting.png',
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
                  elevation: 5,
                  margin: EdgeInsets.symmetric(
                    vertical: 8,
                    horizontal: 10,
                  ),
                  child: ListTile(
                    leading: CircleAvatar(
                      radius: 30,
                      child: Padding(
                        //espaçamento
                        padding: const EdgeInsets.all(6),
                        //para o texto se encaixar ao redor da bola
                        child: FittedBox(
                          child: Text('R\$${tr.value}'),
                        ),
                      ),
                    ),
                    title: Text(
                      tr.title,
                      style: Theme.of(context).textTheme.headline6,
                    ),
                    subtitle: Text(
                      DateFormat('d MMM y').format(tr.date),
                    ),
                    trailing: IconButton(
                      icon: Icon(Icons.delete),
                      color: Theme.of(context).errorColor,
                      onPressed: () => onRemove(tr.id),
                    ),
                  ),
                );
              },
            ),
    );
  }
}
