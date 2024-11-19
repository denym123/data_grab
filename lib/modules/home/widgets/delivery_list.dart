import 'package:data_grab/core/core.dart';
import 'package:data_grab/core/ui/widgets/default_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../home.dart';

class DeliveryList extends StatelessWidget {
  final HomeController controller;

  const DeliveryList({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (context) {
      return Expanded(
        child: RefreshIndicator(
          onRefresh: () {
            return controller.fetchDeliveries();
          },
          child: controller.deliveries.isNotEmpty
              ? ListView.separated(
                  shrinkWrap: false,
                  itemBuilder: (context, index) {
                    Delivery delivery = controller.deliveries[index];
                    return HomeListTile(
                      onPressed: () {},
                      responsibleName: delivery.responsibleName,
                      responsibleDocument: delivery.responsibleDocument,
                      children: delivery.children,
                    );
                  },
                  separatorBuilder: (context, index) {
                    return SizedBox(height: 16.h);
                  },
                  itemCount: controller.deliveries.length,
                )
              : SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(16.w, 60.h, 16.w, 0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset(
                          Assets.imagesNotFound,
                          fit: BoxFit.contain,
                        ),
                        Text(
                          "Nenhuma entrega",
                          style: context.textStyles.semiBold16,
                        ),
                        DefaultButton(
                          icon: Icons.refresh,
                          onPressed: () {
                            controller.fetchDeliveries();
                          },
                          label: "Tentar novamente",
                          backgroundColor: context.colors.primary,
                        )
                      ],
                    ),
                  ),
                ),
        ),
      );
    });
  }
}
