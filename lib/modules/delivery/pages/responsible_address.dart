import 'package:data_grab/core/core.dart';
import 'package:data_grab/core/ui/widgets/default_input_field.dart';
import 'package:data_grab/core/ui/widgets/default_select.dart';
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
                  keyboardType: TextInputType.number,
                ),
                SizedBox(height: 16.h),
                DefaultSelect(
                  value: widget.controller.city,
                  label: "Cidade *",
                  onChanged: (value) {
                    widget.controller.city = value;
                  },
                  validator: (p0) {
                    if (p0 == null) {
                      return "Selecione a cidade";
                    }
                    return null;
                  },
                  options: widget.controller.cities,
                ),
                SizedBox(height: 16.h),
                DefaultInputField(
                  label: "Bairro *",
                  controller: widget.controller.neighborhoodController,
                  validator: isNotEmpty,
                ),
                SizedBox(height: 16.h),
                DefaultInputField(
                  label: "Rua *",
                  controller: widget.controller.addressController,
                  validator: isNotEmpty,
                ),
                SizedBox(height: 16.h),
                DefaultInputField(
                  label: "Número",
                  controller: widget.controller.numberController,
                ),
                SizedBox(height: 24.h),
                Row(
                  children: [
                    Expanded(
                      child: HollowButton(
                          label: "Anterior",
                          onPressed: () {
                            widget.controller.pageController.previousPage(
                              duration: const Duration(milliseconds: 100),
                              curve: Curves.bounceIn,
                            );
                          }),
                    ),
                    SizedBox(width: 24.h),
                    Expanded(
                      child: PrimaryButton(
                        label: "Finalizar",
                        isLoading: false,
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            widget.controller.saveFamily();
                          }
                        },
                      ),
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
