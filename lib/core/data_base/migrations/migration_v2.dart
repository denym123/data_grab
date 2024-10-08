import 'package:sqflite_common/sqlite_api.dart';

import '../data_base.dart';

class MigrationV2 implements Migration {
  @override
  void create(Batch batch) {
    batch.execute('''
ALTER TABLE
  surveys
ADD
  COLUMN questionnaire_updated_at TEXT
''');

    batch.execute('''
ALTER TABLE
  questions
ADD
  COLUMN is_active INTEGER DEFAULT 1
''');

    batch.execute('''
ALTER TABLE
  groups
ADD
  COLUMN is_active INTEGER DEFAULT 1
''');
  }

  @override
  void update(Batch batch) {
    batch.execute('''
ALTER TABLE
  surveys
ADD
  COLUMN questionnaire_updated_at TEXT
''');

    batch.execute('''
ALTER TABLE
  questions
ADD
  COLUMN is_active INTEGER DEFAULT 1
''');

    batch.execute('''
ALTER TABLE
  groups
ADD
  COLUMN is_active INTEGER DEFAULT 1
''');
  }
}
