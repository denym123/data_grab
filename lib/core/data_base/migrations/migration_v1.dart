import 'package:sqflite_common/sqlite_api.dart';

import 'migrations.dart';

class MigrationV1 implements Migration {
  @override
  void create(Batch batch) {
    batch.execute('''
      CREATE table responsible (
        id INTEGER PRIMARY KEY,
        person_number TEXT, 
        interviewer_name TEXT,
        interviewer_document TEXT,
        name TEXT,
        document TEXT,
        birthday TEXT,
        created_at TEXT,
        sex TEXT,
        nationality TEXT,
        community TEXT,
        zip TEXT,
        city TEXT,
        neighborhood TEXT,
        street TEXT,
        number TEXT);''');
  }

  @override
  void update(Batch batch) {
    batch.execute('''
      CREATE table responsible (
        id INTEGER PRIMARY KEY,
        interviewer_name TEXT,
        interviewer_document TEXT,
        person_number TEXT,
        name TEXT,
        document TEXT,
        birthday TEXT,
        sex TEXT,
        nationality TEXT,
        community TEXT,
        zip TEXT,
        city TEXT,
        neighborhood TEXT,
        street TEXT,
        created_at TEXT,
        number TEXT);''');
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
}
