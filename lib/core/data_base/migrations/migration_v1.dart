import 'package:sqflite_common/sqlite_api.dart';

import '../../constants/tables.dart';
import 'migrations.dart';

class MigrationV1 implements Migration {
  @override
  void create(Batch batch) {
    batch.execute('''
      CREATE table person (
        id INTEGER PRIMARY KEY,
        name TEXT,
        document TEXT,
        birthday TEXT,
        sex TEXT,
        is_parent INTEGER,
        ethnicity TEXT,
        community TEXT,
        zip TEXT,
        city TEXT,
        street TEXT,
        family_id INTEGER,
        FOREIGN KEY(family_id) REFERENCES family(id));
    ''');

    batch.execute('''
      CREATE table family (
        id INTEGER PRIMARY KEY,
        interviewer_name TEXT,
        interviewer_document TEXT);
    ''');
  }

  @override
  void update(Batch batch) {
    batch.execute('''
      CREATE table person (
        id INTEGER PRIMARY KEY,
        name TEXT,
        document TEXT,
        birthday TEXT,
        sex TEXT,
        is_parent INTEGER,
        ethnicity TEXT,
        community TEXT,
        zip TEXT,
        city TEXT,
        street TEXT,
        family_id INTEGER,
        FOREIGN KEY(family_id) REFERENCES family(id) );
    ''');

    batch.execute('''
      CREATE table family (
        id INTEGER PRIMARY KEY,
        interviewer_name TEXT,
        interviewer_document TEXT);
    ''');
  }
}


//Nome
//Documento
//Data de Nascimento
//Sexo
//Etnia
//Comunidade
//CEP
//Cidade
//Bairro
//Rua