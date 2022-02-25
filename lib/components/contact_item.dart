import 'package:curso_alura_2/screens/transaction_form.dart';
import 'package:flutter/material.dart';
import '../models/contact.dart';

class ContactItem extends StatelessWidget {

  final Contact contact;
  // ignore: use_key_in_widget_constructors
  const ContactItem(this.contact);


  @override
  Widget build(BuildContext context) {
    return Card(
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => TransactionForm(contact)));
        },
        child: ListTile(
          title: Text(contact.name,
              style: const TextStyle(
                fontSize: 24.0,
              )),
          subtitle: Text(
            contact.accountNumber.toString(),
            style: const TextStyle(fontSize: 16.0),
          ),
        ),
      ),
    );
  }
}
