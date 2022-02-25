import 'package:sqflite/sqflite.dart';

Future<Database> getDatabase() async {
  final String dbPath = await getDatabasesPath();
  final String path = dbPath + '/bytebank.db';

  return openDatabase(
    path,
    onCreate: (db, version) {
      db.execute('CREATE TABLE contacts('
          'id INTEGER PRIMARY KEY, '
          'name TEXT, '
          'account_number INTEGER)');
    },
    version: 1,
    onDowngrade: onDatabaseDowngradeDelete,
  );
}
