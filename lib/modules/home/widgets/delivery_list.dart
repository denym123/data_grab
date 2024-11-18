import 'package:data_grab/core/core.dart';
import 'package:flutter/material.dart';

import '../home.dart';

class DeliveryList extends StatelessWidget {
  final HomeController controller;
  const DeliveryList({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: RefreshIndicator(
        onRefresh: () {
          return controller.fetchDeliveries();
        },
        child: controller.deliveries.isNotEmpty
            ? ListView.separated(
                shrinkWrap: true,
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
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(Assets.imagesNotFound, height: 20.h),
                  Text(
                    "Nenhuma entrega",
                    style: context.textStyles.semiBold,
                  ),
                ],
              ),
      ),
    );
  }
}
