// ignore_for_file: unused_import, use_key_in_widget_constructors, unnecessary_import, no_logic_in_create_state
import 'package:flutter/material.dart';
// ignore: implementation_imports
import 'package:despesas/components/transection_form.dart';
import 'package:despesas/components/transection_list.dart';
// ignore: implementation_imports
import 'package:flutter/src/foundation/key.dart';
// ignore: implementation_imports
import 'package:flutter/src/widgets/framework.dart';

import 'transection_form.dart';
import 'transection_list.dart';
import '../models/transection.dart';

class TransectionUser extends StatefulWidget {
  @override
  _TransectionUserState createState() => _TransectionUserState();
}

class _TransectionUserState extends State<TransectionUser> {
  final _transections = [
    transection(
        date: DateTime.now(), id: 't1', title: 'Tenis Novo', value: 310.99),
    transection(
        date: DateTime.now(), id: 't2', title: 'Conta Luz', value: 250.11),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        TransectionList(_transections),
        TransectionForm(),
      ],
    );
  }
}
