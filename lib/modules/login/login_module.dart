import 'package:flutter_modular/flutter_modular.dart';

import 'login.dart';

class LoginModule extends Module {

  @override
  void binds(Injector i) {
    i.addSingleton(LoginController.new);
  }

  @override
  void routes(RouteManager r) {
    r.child(
      Modular.initialRoute,
      child: (context) => const LoginPage(),
    );
  }

}
