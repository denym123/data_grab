import 'package:data_grab/core/core.dart';
import 'package:data_grab/core/ui/widgets/default_input_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../delivery.dart';

class ResponsibleAddress extends StatefulWidget {
  final DeliveryController controller;

  const ResponsibleAddress({super.key, required this.controller});

  @override
  State<ResponsibleAddress> createState() => _ResponsibleAddressState();
}

class _ResponsibleAddressState extends State<ResponsibleAddress>
    with FormValidator {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.r),
      child: Observer(builder: (context) {
        return SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Dados do responsável",
                  style: context.textStyles.bold16.copyWith(
                    color: context.colors.primary,
                  ),
                ),
                SizedBox(height: 16.h),
                DefaultInputField(
                  label: "CEP",
                  controller: widget.controller.cepController,
                  masks: ["99999-999"],
                  validator: isNotEmpty,
                  keyboardType: TextInputType.number,
                ),
                SizedBox(height: 16.h),
                DefaultInputField(
                  label: "Cidade",
                  controller: widget.controller.cityController,
                  validator: isNotEmpty,
                ),
                SizedBox(height: 16.h),
                DefaultInputField(
                  label: "Bairro",
                  controller: widget.controller.neighborhoodController,
                  validator: isNotEmpty,
                ),
                SizedBox(height: 16.h),
                DefaultInputField(
                  label: "Rua",
                  controller: widget.controller.addressController,
                  validator: isNotEmpty,
                ),
                SizedBox(height: 24.h),
                Row(
                  children: [
                    Expanded(
                      child: HollowButton(label: "Anterior", onPressed: () {}),
                    ),
                    SizedBox(width: 24.h),
                    Expanded(
                      child: PrimaryButton(
                          label: "Próximo",
                          isLoading: false,
                          onPressed: () {
                            if (formKey.currentState!.validate()) {
                              widget.controller.pageController.nextPage(
                                duration: const Duration(milliseconds: 100),
                                curve: Curves.bounceIn,
                              );
                            }
                          }),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
