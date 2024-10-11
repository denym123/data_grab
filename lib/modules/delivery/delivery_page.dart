import 'package:flutter/material.dart';

import '../../core/core.dart';
import 'delivery.dart';
import 'pages/pages.dart';

class DeliveryPage extends StatefulWidget {
  const DeliveryPage({super.key});

  @override
  State<DeliveryPage> createState() => DeliveryPageState();
}

class DeliveryPageState
    extends PageLifeCycleState<DeliveryController, DeliveryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const DefaultAppBar(title: "Nova entrega"),
        body: Column(
          children: [
            Expanded(
              child: PageView(
                controller: controller.pageController,
                children: [
                  ResponsibleData(controller: controller),
                  ResponsibleAddress(controller: controller),
                  Dependent(controller: controller),
                ],
              ),
            ),
          ],
        ));
  }
}
