import 'package:data_grab/core/core.dart';
import 'package:data_grab/core/ui/widgets/default_input_field.dart';
import 'package:data_grab/core/ui/widgets/default_select.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../delivery.dart';

class DependentModal extends StatefulWidget {
  final DeliveryController controller;
  const DependentModal({super.key, required this.controller});

  @override
  State<DependentModal> createState() => _DependentModalState();
}

class _DependentModalState extends State<DependentModal> with FormValidator {

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding:
      EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),      child: Form(
        key: formKey,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Observer(
              builder: (context) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      "Novo Dependente",
                      style: context.textStyles.semiBold16,
                    ),
                    SizedBox(height: 16.h),
                    DefaultInputField(
                      label: "Nome",
                      controller: widget.controller.dependentNameController,
                      validator: isNotEmpty,
                    ),
                    SizedBox(height: 16.h),
                    DefaultInputField(
                      label: "Documento",
                      keyboardType: TextInputType.number,
                      controller: widget.controller.dependentDocumentController,
                      validator: isDocumentValid,
                      masks: const [
                        Masks.cpfMask,
                      ],
                    ),
                    SizedBox(height: 16.h),
                     DefaultInputField(
                       masks: const ["99/99/9999"],
                      label: "Data de Nascimento",
                      keyboardType: TextInputType.datetime,
                      controller: widget.controller.dependentBirthDayController,
                       validator: isNotEmpty,
                    ),
                    SizedBox(height: 16.h),
                    DefaultSelect(
                      options: [
                      OptionModel(name: "Masculino", id: 1),
                      OptionModel(name: "Feminino", id: 2),
                      ],
                      onChanged: (value) {
                        widget.controller.dependentSex = value;
                      },
                      value: widget.controller.dependentSex,
                      label: "Sexo",
                    ),
                    SizedBox(height: 16.h),
                    DefaultSelect(
                      onChanged: (value) {
                        widget.controller.dependentCommunity = value;
                      },
                      value: widget.controller.dependentCommunity,
                      options: widget.controller.races,
                      label: "Etnia",
                    ),
                    SizedBox(height: 24.h),
                     PrimaryButton(label: "Confirmar", isLoading: false, onPressed: () {
                        if (formKey.currentState!.validate()) {
                          widget.controller.addDependent();
                          Modular.to.pop();
                        }
                    },)
                  ],
                );
              }
            ),
          ),
        ),
      ),
    );
  }
}
