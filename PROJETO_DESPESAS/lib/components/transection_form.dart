// ignore_for_file: use_key_in_widget_constructors, unnecessary_import, unused_import, deprecated_member_use, prefer_const_constructors, avoid_print

import 'package:flutter/material.dart';
// ignore: implementation_imports
import 'package:flutter/src/foundation/key.dart';
// ignore: implementation_imports
import 'package:flutter/src/widgets/framework.dart';

class TransectionForm extends StatefulWidget {
  final void Function(String, double) onSubmit;

  TransectionForm(this.onSubmit);

  @override
  State<TransectionForm> createState() => _TransectionFormState();
}

class _TransectionFormState extends State<TransectionForm> {
  final titleController = TextEditingController();

  final valueController = TextEditingController();

  _submitForm() {
    final title = titleController.text;
    final value = double.tryParse(valueController.text) ?? 0.0;

// caso o nome não for válido e o valor menor ou igual a zero a transação não é válida e retorna a função
    if (title.isEmpty || value <= 0) {
      return;
    }
    widget.onSubmit(title, value);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          // ignore: prefer_const_literals_to_create_immutables
          children: <Widget>[
            TextField(
              controller: titleController,
              onSubmitted: (_) => _submitForm(),
              // ignore: prefer_const_constructors
              decoration: InputDecoration(
                labelText: 'Título',
              ),
            ),
            TextField(
              controller: valueController,
              // para aparecer o teclado de número
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              onSubmitted: (_) => _submitForm(),
              // ignore: prefer_const_constructors
              decoration: InputDecoration(
                labelText: 'Valor(R\$)',
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                FlatButton(
                  child: Text('Nova Transação'),
                  textColor: Colors.purple,
                  onPressed: _submitForm,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
