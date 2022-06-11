// ignore_for_file: prefer_const_constructors_in_immutables, use_key_in_widget_constructors, prefer_const_constructors, sized_box_for_whitespace

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  final String label;
  final double value;
  final double percentage;

  ChartBar({
    required this.label,
    required this.value,
    required this.percentage,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FittedBox(
          child: Text('${value.toStringAsFixed(2)}'),
        ),
        SizedBox(
          height: 5,
        ),
        Container(
          height: 60,
          width: 10,
          //permitir um componente em cima do outro
          child: Stack(
            // gráfico de baixo para cima
            alignment: Alignment.bottomCenter,
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              Container(
                decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.grey,
                      width: 1.0,
                    ),
                    color: Color.fromRGBO(220, 220, 220, 1),
                    //bordas redondas do gráfico dia da semana
                    borderRadius: BorderRadius.circular(5)),
              ),
              // ocupar o mesmo espaço ocupado pela Stack
              FractionallySizedBox(
                heightFactor: percentage,
                child: Container(
                    decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  //bordas redondas do gráfico dia da semana
                  borderRadius: BorderRadius.circular(5),
                )),
              )
            ],
          ),
        ),
        SizedBox(
          height: 5,
        ),
        Text(label)
      ],
    );
  }
}
