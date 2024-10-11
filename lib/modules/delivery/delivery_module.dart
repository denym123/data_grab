import 'package:flutter_modular/flutter_modular.dart';

import 'delivery.dart';

class DeliveryModule extends Module {

  @override
  void binds(Injector i) {
    i.addSingleton(DeliveryController.new);
    i.add(DeliveryRepository.new);
  }

  @override
  void routes(RouteManager r) {
    r.child(Modular.initialRoute, child: (context) => const DeliveryPage(),);
  }

}
