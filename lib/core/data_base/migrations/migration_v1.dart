import 'package:sqflite_common/sqlite_api.dart';

import 'migrations.dart';

class MigrationV1 implements Migration {
  @override
  void create(Batch batch) {
    batch.execute('''
      CREATE TABLE surveys (
        id INTEGER PRIMARY KEY,
        hash TEXT,
        started_at TEXT,
        finished_at TEXT,
        status INTEGER,
        user_id INTEGER,
        questionnaire_id INTEGER,
        FOREIGN KEY (questionnaire_id) REFERENCES questionnaires(id)
      );
    ''');

    batch.execute('''
      CREATE TABLE questionnaires (
        id INTEGER PRIMARY KEY,
        title TEXT,
        address_required INTEGER,
        allow_address INTEGER,
        description TEXT,
        enabled INTEGER,
        updated_at TEXT
      );
      ''');

    batch.execute('''CREATE TABLE groups (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        title TEXT, 
        is_address INTEGER,
        questionnaire_id INTEGER, 
        condition TEXT,
        order_num INTEGER,
        FOREIGN KEY (questionnaire_id) REFERENCES questionnaires(id));''');

    batch.execute('''CREATE TABLE questions (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        title TEXT, 
        type TEXT, 
        group_id INTEGER, 
        required INTEGER,
        condition TEXT,
        order_num INTEGER,
        FOREIGN KEY (group_id) REFERENCES groups(id));''');

    batch.execute('''
    CREATE TABLE field_types (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT,
    allow_multiple_options INTEGER,
    has_options INTEGER,
    is_conditional INTEGER,
    question_id INTEGER,
    FOREIGN KEY (question_id) REFERENCES questions(id)
    );''');

    batch.execute('''
    CREATE TABLE options(
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    label TEXT,
    allow_notes INTEGER
    );''');

    batch.execute('''
    CREATE TABLE question_options (
    question_id INTEGER,
    option_id INTEGER,
    PRIMARY KEY (question_id, option_id),
    FOREIGN KEY (question_id) REFERENCES questions(id),
    FOREIGN KEY (option_id) REFERENCES options(id)
    );''');

    batch.execute('''
    CREATE TABLE questionnaire_answers (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    question_id INTEGER,
    option_id INTEGER,
    survey_id INTEGER,
    group_id INTEGER,
    value TEXT,
    notes TEXT,
    FOREIGN KEY (question_id) REFERENCES questions(id),
    FOREIGN KEY (option_id) REFERENCES options(id),
    FOREIGN KEY (survey_id) REFERENCES surveys(id) ON DELETE CASCADE,
    FOREIGN KEY (group_id) REFERENCES groups(id));
    ''');

    batch.execute('''
    CREATE TABLE questionnaire_addresses (
    survey_id INTEGER PRIMARY KEY,
    zipcode TEXT,
    state_id INTEGER,
    city_id INTEGER,
    neighborhood_id INTEGER,
    address TEXT,
    number TEXT,
    reference TEXT,
    FOREIGN KEY (survey_id) REFERENCES surveys(id) ON DELETE CASCADE,
    FOREIGN KEY (state_id) REFERENCES states(id),
    FOREIGN KEY (city_id) REFERENCES cities(id),
    FOREIGN KEY (neighborhood_id) REFERENCES neighborhoods(id)
    );''');

    batch.execute('''
CREATE UNIQUE INDEX idx_survey_question ON questionnaire_answers(survey_id, question_id);
''');

    batch.execute('''
    CREATE TABLE states(
    id INTEGER PRIMARY KEY,
    updated_at TEXT,
    active INTEGER,
    uf TEXT,
    state TEXT);''');

    batch.execute('''
    CREATE TABLE cities(
    id INTEGER PRIMARY KEY,
    city TEXT,
    uf TEXT,
    state_id INTEGER,
    FOREIGN KEY (state_id) REFERENCES states(id)
    );''');

    batch.execute('''
    CREATE TABLE neighborhoods (
    id INTEGER PRIMARY KEY,
    neighborhood TEXT,
    landmark TEXT,
    landmark_type TEXT,
    city_id INTEGER,
    FOREIGN KEY (city_id) REFERENCES cities(id)
    );''');

    batch.execute('''
    CREATE TABLE addresses (
    zipcode INTEGER PRIMARY KEY,
    landmark TEXT,
    landmark_type TEXT,
    searchable_text TEXT,
    searchable_text_ts TEXT,
    full_landmark TEXT,
    neighborhood_id INTEGER,
    FOREIGN KEY (neighborhood_id) REFERENCES neighborhoods(id)
    );
    ''');
  }

  @override
  void update(Batch batch) {}
}
