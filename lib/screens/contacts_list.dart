import 'package:curso_alura_2/components/contact_item.dart';
import 'package:curso_alura_2/database/dao/contact_dao.dart';
import 'package:curso_alura_2/models/contact.dart';
import 'package:curso_alura_2/screens/contact_form.dart';
import 'package:flutter/material.dart';


class ContactsList extends StatefulWidget {
  const ContactsList({Key? key}) : super(key: key);

  @override
  State<ContactsList> createState() => _ContactsListState();
}

class _ContactsListState extends State<ContactsList> {
  final ContactDao _dao = ContactDao();

  @override
  Widget build(BuildContext context) {
    //contacts.add(Contact(0, 'natan', 1000));

    return Scaffold(
      appBar: AppBar(
        title: const Text('Transfer'),
      ),
      body: FutureBuilder<List<Contact>>(
          initialData: [],
          future: _dao.findAll(),
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.none:
                break;
              case ConnectionState.waiting:
                const Center(child: CircularProgressIndicator());
                break;
              case ConnectionState.active:
                break;
              case ConnectionState.done:
                final List<Contact> contacts = snapshot.data is Object
                    ? snapshot.data as List<Contact>
                    : [];

                return ListView.builder(
                  itemBuilder: (context, index) {
                    final Contact contact = contacts[index];
                    return ContactItem(contact);
                  },
                  itemCount: contacts.length,
                );
            }
            return const Text('Error');
          }),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).primaryColor,
        child: const Icon(
          Icons.add,
        ),
        onPressed: () {
          Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => ContactForm(),
                ),
              )
              .then(
                (value) => setState(() {}),
              );
        },
      ),
    );
  }
}
