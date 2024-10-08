import 'migrations/migrations.dart';

class SqliteMigrationFactory {
  List<Migration> getCreateMigration() => [
        MigrationV1(),
        MigrationV2(),
        MigrationV3(),
      ];

  List<Migration> getUpgradeMigration(int version) {
    final migrations = <Migration>[];
    if (version == 1) {
      migrations.add(MigrationV1());
    }

    if (version == 2) {
      migrations.add(MigrationV2());
    }

    if (version == 3) {
      migrations.add(MigrationV3());
    }

    return migrations;
  }
}
