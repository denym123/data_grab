import 'package:sqflite_common/sqlite_api.dart';
import 'migration.dart';

class MigrationV3 implements Migration {
  @override
  void create(Batch batch) {
    batch.execute('''
ALTER TABLE questionnaire_answers ADD COLUMN option_ids TEXT;
    ''');

    batch.execute('''
ALTER TABLE options ADD COLUMN note_label TEXT;
    ''');

    batch.execute('''
ALTER TABLE
    question_options
ADD
    COLUMN order_num INTEGER
''');
  }

  @override
  void update(Batch batch) {
    create(batch);
  }
}
