import 'package:flutter_modular/flutter_modular.dart';

import '../../core/core.dart';
import '../../core/local_storage/flutter_secure_storage/flutter_secure_storage_impl.dart';

class CoreModule extends Module {
  @override
  void exportedBinds(Injector i) {
    i.addLazySingleton<LocalSecureStorage>(FlutterSecureStorageImpl.new);
  }
}
