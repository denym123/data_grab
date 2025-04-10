import 'package:data_grab/core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:intl/intl.dart';

import '../home.dart';

class DeliveryList extends StatelessWidget {
  final HomeController controller;

  const DeliveryList({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) {
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
                        personNumber: delivery.personNumber,
                        createdAt: delivery.createdAt != null
                            ? DateFormat('dd/MM/yyyy - HH:mm').format(
                                delivery.createdAt!,
                              )
                            : "",
                      );
                    },
                    separatorBuilder: (context, index) {
                      return SizedBox(height: 16.h);
                    },
                    itemCount: controller.deliveries.length,
                  )
                : SingleChildScrollView(
                    physics: const AlwaysScrollableScrollPhysics(),
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(16.w, 150.h, 16.w, 0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            child: Image.asset(
                              Assets.imagesLogoGov,
                              fit: BoxFit.contain,
                            ),
                          ),
                          SizedBox(height: 24.h),
                          Text(
                            "Nenhuma entrega registrada hoje!",
                            style: context.textStyles.bold
                                .copyWith(fontSize: 20.sp),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(height: 16.h),
                          Text(
                            "Clique no botão acima para criar uma nova entrega!",
                            style: context.textStyles.medium
                                .copyWith(fontSize: 16.sp),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    )),
          ),
        );
      },
    );
  }
}
