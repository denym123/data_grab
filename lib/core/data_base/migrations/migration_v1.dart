import 'package:sqflite_common/sqlite_api.dart';

import '../../constants/tables.dart';
import 'migrations.dart';

class MigrationV1 implements Migration {
  @override
  void create(Batch batch) {
    batch.execute(
      '''
      CREATE TABLE IF NOT EXISTS ${Tables.deliveries} (
        id INTEGER PRIMARY KEY,
        created_at TEXT,
        user_name TEXT,
        user_document TEXT,
        responsible_id INTEGER,
        FOREIGN KEY(responsible_id) REFERENCES ${Tables.responsibles}(id)
        );
      '''
    );

    batch.execute(
      '''
      CREATE TABLE IF NOT EXISTS ${Tables.responsibles} (
        id INTEGER PRIMARY KEY,
        name TEXT,
        document TEXT,
        birthday TEXT,
        nacionality TEXT,
        marital_status TEXT,
        race TEXT,
        contact TEXT,
        address TEXT,
        comunity TEXT,
        city TEXT
      );
      '''
    );
    batch.execute(
      '''
      CREATE TABLE IF NOT EXISTS ${Tables.dependents} (
        id INTEGER PRIMARY KEY,
        name TEXT,
        document TEXT,
        birthday TEXT,
        responsible_id INTEGER,
        race TEXT,
        nacionality TEXT
        FOREIGN KEY(responsible_id) REFERENCES ${Tables.responsibles}(id)
        );
      '''
    );
  }

  @override
  void update(Batch batch) {}
}
