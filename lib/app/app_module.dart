import 'package:flutter_modular/flutter_modular.dart';

import '../core/core.dart';
import '../global_modules/global_modules.dart';
import '../modules/modules.dart';

class AppModule extends Module {
  @override
  List<Module> get imports => [
        CoreModule(),
      ];

  @override
  void routes(RouteManager r) {
    r.module(Modular.initialRoute, module: SplashModule());
    r.module(Routes.login, module: LoginModule());
  }
}
