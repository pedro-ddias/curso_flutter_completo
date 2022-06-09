// ignore_for_file: prefer_const_constructors, unused_import, use_key_in_widget_constructors, prefer_const_constructors_in_immutables, unused_local_variable, unrelated_type_equality_checks
import 'package:despesas/components/transection_form.dart';

import 'package:intl/intl.dart';
import '../models/transection.dart';
import 'package:flutter/material.dart';

class Chart extends StatelessWidget {
  final List<transection> recentTransection;

  Chart(this.recentTransection);

  List<Map<String, Object>> get groupedTransactions {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(
        Duration(days: index),
      );

      double totalSum = 0.0;

      for (var i = 0; i < recentTransection.length; i++) {
        bool sameDay = recentTransection[i].date.day == weekDay.day;
        bool sameMonth = recentTransection[i].date.month == weekDay.month;
        bool sameYear = recentTransection[i].date.year == weekDay.year;

        if (sameDay && sameMonth && sameYear) {
          totalSum += recentTransection[i].value;
        }
      }

      return {
        'day': DateFormat.E().format(weekDay)[0],
        'value': totalSum,
      };
    });
  }

  @override
  Widget build(BuildContext context) {
    groupedTransactions;
    return Card(
      elevation: 6,
      margin: EdgeInsets.all(20),
      child: Row(
        // ignore: prefer_const_literals_to_create_immutables
        children: groupedTransactions.map((tr) {
          return Text('${tr['day']}: ${tr['value']}');
        }).toList(),
      ),
    );
  }
}
