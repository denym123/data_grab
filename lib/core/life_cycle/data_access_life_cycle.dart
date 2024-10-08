import 'package:flutter_modular/flutter_modular.dart';

import '../core.dart';
import '../data_base/data_base.dart';

abstract class DataAccessLifeCycle {
  final db = Modular.get<SqliteConnectionFactory>().database;
  final httpAdapter = Modular.get<HttpAdapter>();
}
