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
      drawer: const DefaultDrawer(),
      appBar: const DefaultAppBar(
        title: "Todas entregas",
        hasDrawer: true,
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(16.w, 16.h, 16.w, 0),
        child: Column(
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
                  backgroundColor: Color(0xff279629),
                  icon: Icons.upload_file_rounded,
                  onPressed: () {
                    controller.exportDeliveryDataToExcel();
                  },
                ),
              ],
            ),
            SizedBox(height: 16.h),
            DeliveryList(controller: controller),
          ],
        ),
      ),
    );
  }
}
