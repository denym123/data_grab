import 'package:data_grab/app/app_widget.dart';
import 'package:data_grab/core/core.dart';
import 'package:data_grab/core/ui/widgets/default_select.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../../core/ui/widgets/default_input_field.dart';
import '../controllers/controllers.dart';

class ResponsibleData extends StatefulWidget {
  final DeliveryController controller;

  const ResponsibleData({super.key, required this.controller});

  @override
  State<ResponsibleData> createState() => _ResponsibleDataState();
}

class _ResponsibleDataState extends State<ResponsibleData> with FormValidator {
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
                  label: 'Nome *',
                  controller: widget.controller.nameController,
                  validator: isNotEmpty,
                ),
                SizedBox(height: 24.h),
                DefaultInputField(
                  label: 'CPF *',
                  controller: widget.controller.documentController,
                  masks: const [Masks.cpfMask],
                  validator: isDocumentValid,
                  keyboardType: TextInputType.number,
                ),
                SizedBox(height: 24.h),
                DefaultInputField(
                  keyboardType: TextInputType.number,
                  label: 'Data de nascimento *',
                  controller: widget.controller.birthDayController,
                  validator: isNotEmpty,
                  masks: const ['99/99/9999'],
                ),
                SizedBox(height: 24.h),
                DefaultSelect(
                  value: widget.controller.nationality,
                  onChanged: (value) {
                    widget.controller.nationality = value;
                  },
                  label: 'Nacionalidade *',
                  validator: (p0) {
                    if (p0 == null) {
                      return "Por favor selecione um país";
                    }
                    return null;
                  },
                  options: widget.controller.nationalities,
                ),
                SizedBox(height: 24.h),
                DefaultSelect(
                  options: [
                    OptionModel(name: "Masculino", id: 1),
                    OptionModel(name: "Feminino", id: 2),
                    OptionModel(name: "Outro", id: 3),
                  ],
                  onChanged: (value) {
                    widget.controller.sex = value;
                  },
                  validator: (p0) {
                    if (p0 == null) {
                      return "Por favor selecione um gênero";
                    }
                  },
                  value: widget.controller.sex,
                  label: "Sexo *",
                ),
                SizedBox(height: 24.h),
                DefaultSelect(
                  value: widget.controller.community,
                  options: widget.controller.races,
                  label: "Etnia",
                  onChanged: (p0) {
                    widget.controller.community = p0;
                  },
                ),
                SizedBox(height: 32.h),
                Row(
                  children: [
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
