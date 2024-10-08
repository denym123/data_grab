import 'package:sqflite_common/sqlite_api.dart';
import 'migration.dart';

class MigrationV3 implements Migration {
  @override
  void create(Batch batch) {}

  @override
  void update(Batch batch) {
    create(batch);
  }
}
