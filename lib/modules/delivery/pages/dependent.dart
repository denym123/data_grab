import 'package:data_grab/core/core.dart';
import 'package:data_grab/core/ui/widgets/default_button.dart';
import 'package:flutter/material.dart';

import '../controllers/controllers.dart';
import '../widgets/widgets.dart';

class Dependent extends StatelessWidget {
  final DeliveryController controller;

  const Dependent({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
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
                onPressed: () {},
                backgroundColor: context.colors.primary,
              ),
            ],
          ),
          SizedBox(width: 16.w),
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) {
                return DependentTile();
              },
            ),
          ),
          Row(
            children: [
              Expanded(
                child: HollowButton(
                  label: "Teste",
                ),
              ),
              SizedBox(width: 24.w),
              Expanded(
                child: PrimaryButton(
                  label: "Teste",
                  isLoading: false,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
