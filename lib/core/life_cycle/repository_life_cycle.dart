import 'package:flutter_modular/flutter_modular.dart';

import '../core.dart';

abstract class RepositoryLifeCycle<H extends HttpAdapter> {
  final httpAdapter = Modular.get<H>();
}