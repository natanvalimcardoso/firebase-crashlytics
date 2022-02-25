// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class TextFieldComponents extends StatelessWidget {
  const TextFieldComponents(
      {Key? key,
      required this.labelText,
      required this.controlador,
      required this.keyboardType})
      : super(key: key);

  final String labelText;
  final TextEditingController controlador;
  final TextInputType keyboardType;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        controller: controlador,
        decoration: InputDecoration(
          labelText: labelText,
        ),
        style: TextStyle(fontSize: 24),
        keyboardType: keyboardType,
      ),
    );
  }
}
