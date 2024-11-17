import 'package:data_grab/core/ui/widgets/default_button.dart';
import 'package:data_grab/modules/home/widgets/delivery_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../core/core.dart';
import 'home.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => HomePageState();
}

class HomePageState extends PageLifeCycleState<HomeController, HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DefaultDrawer(),
      appBar: const DefaultAppBar(
        title: "Todas entregas",
        hasDrawer: true,
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(16.w, 16.h, 16.w, 0),
        child: Observer(builder: (context) {
          return Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  DefaultButton(
                    label: "Nova entrega",
                    backgroundColor: context.colors.primary,
                    icon: Icons.add,
                    onPressed: AppRoutes.goToDelivery,
                  ),
                  DefaultButton(
                    label: "Exportar",
                    backgroundColor: Colors.blue,
                    icon: Icons.upload_file_rounded,
                    onPressed: () {
                    },
                  ),
                ],
              ),
              SizedBox(height: 16.h),
              controller.deliveries.isEmpty
                  ? const Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text("Nenhuma entrega"),
                        ],
                      ),
                    )
                  : DeliveryList(controller: controller),
            ],
          );
        }),
      ),
    );
  }
}
