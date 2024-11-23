import 'package:data_grab/core/core.dart';
import 'package:data_grab/core/ui/widgets/default_button.dart';
import 'package:data_grab/modules/delivery/models/dependent_model.dart';
import 'package:data_grab/modules/delivery/widgets/dependent_modal.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../controllers/controllers.dart';
import '../widgets/widgets.dart';

class Dependent extends StatelessWidget {
  final DeliveryController controller;

  const Dependent({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.r),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Dependentes",
                style: context.textStyles.semiBold16
                    .copyWith(color: context.colors.primary),
              ),
              DefaultButton(
                label: "Novo",
                onPressed: () async {
                  await showModalBottomSheet(
                    isScrollControlled: true,
                    context: context,
                    builder: (context) {
                      return DependentModal(controller: controller);
                    },
                    backgroundColor: Colors.white,
                  ).whenComplete(() {
                    controller.clearDependentFields();
                  });
                },
                backgroundColor: context.colors.primary,
              ),
            ],
          ),
          SizedBox(height: 16.h),
          Observer(builder: (context) {
            if (controller.dependents.isEmpty) {
              return Expanded(
                child: Padding(
                  padding: EdgeInsets.all(16.r),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(Assets.imagesNotFound),
                      SizedBox(height: 16.h),
                      Text(
                        "Não há dependentes cadastrados",
                        style: context.textStyles.bold16,
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 8.h),
                      Text(
                        "Precisa de ao menos um dependente para continuar",
                        style: context.textStyles.medium,
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              );
            }
            return Expanded(
              child: ListView.separated(
                separatorBuilder: (context, index) {
                  return SizedBox(height: 8.h);
                },
                itemCount: controller.dependents.length,
                itemBuilder: (context, index) {
                  DependentModel dependent = controller.dependents[index];
                  return DependentTile(
                    title: dependent.name,
                    document: dependent.document,
                    birthdate: dependent.birthDay,
                  );
                },
              ),
            );
          }),
          SizedBox(
            height: 16.h,
          ),
          Row(
            children: [
              Expanded(
                child: HollowButton(
                  label: "Voltar",
                  onPressed: () {
                    controller.pageController.animateToPage(
                      controller.pageController.page!.round() - 1,
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                    );
                  },
                ),
              ),
              SizedBox(width: 24.w),
              Expanded(
                child: PrimaryButton(
                  label: "Finalizar",
                  isLoading: false,
                  onPressed: () {
                    if (controller.dependents.isNotEmpty) {
                      controller.saveFamily();
                    } else {
                      Messages.alert(
                          "Deve ter pelo menos um dependente cadastrado");
                    }
                  },
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
