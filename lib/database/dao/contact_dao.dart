import 'package:sqflite/sqflite.dart';
import '../../models/contact.dart';
import '../app_database.dart';

class ContactDao {
  Future<int> save(Contact contact) async {
    final Database db = await getDatabase();
    final Map<String, dynamic> contactMap = {};
    contactMap['name'] = contact.name;
    contactMap['account_number'] = contact.accountNumber;
    return db.insert('contacts', contactMap);
  }

  Future<List<Contact>> findAll() async {
    final Database db = await getDatabase();
    final List<Map<String, dynamic>> result = await db.query('contacts');
    final List<Contact> contacts = [];
    for (Map<String, dynamic> row in result) {
      final Contact contact = Contact(
        accountNumber: row['account_number'],
        name: row['name'],
      );
      contacts.add(contact);
    }
    return contacts;
  }
}
