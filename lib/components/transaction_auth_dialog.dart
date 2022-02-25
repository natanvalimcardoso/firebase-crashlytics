// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class TransactionAuthDialog extends StatefulWidget {
  
  final Function(String password) onConfirm;

  const TransactionAuthDialog({Key? key, required this.onConfirm}): super(key: key);

  
  @override
  State<TransactionAuthDialog> createState() => _TransactionAuthDialogState();
}

class _TransactionAuthDialogState extends State<TransactionAuthDialog> {
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Material(
      child: AlertDialog(
        title: Text("Authenticate"),
        content: TextField(
          controller: _passwordController,
          decoration: InputDecoration(
            hintText: "Password",
          ),
          obscureText: true,
          maxLength: 4,
          keyboardType: TextInputType.number,
          style: TextStyle(fontSize: 16),
        ),
        actions: [
          TextButton(
            child: Text("Cancel"),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          TextButton(
            child: Text("Confirm"),
            onPressed: () {
              widget.onConfirm(_passwordController.text);//passando a informação via callback 
              Navigator.pop(context); //* Tira o dialogo OU seja ele fecha a pagina
            },
          ),
        ],
      ),
    );
  }
}
