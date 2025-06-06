import 'package:data_grab/core/ui/widgets/default_input_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../core/core.dart';
import 'login.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => LoginPageState();
}

class LoginPageState extends PageLifeCycleState<LoginController, LoginPage>
    with FormValidator {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.w),
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 150.h),
                Image.asset(Assets.imagesLogoGov, fit: BoxFit.contain),
                SizedBox(height: 24.h),
                Text(
                  "Insira seu nome completo e CPF para registrar seu nome nas entregas.",
                  style: context.textStyles.bold16,
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 44.h),
                DefaultInputField(
                  label: "Nome completo",
                  controller: controller.nameController,
                  validator: isNotEmpty,
                ),
                SizedBox(height: 16.h),
                DefaultInputField(
                  label: "CPF",
                  controller: controller.cpfController,
                  masks: const [Masks.cpfMask],
                  validator: isDocumentValid,
                ),
                SizedBox(height: 32.h),
                Observer(
                  builder: (context) {
                    return PrimaryButton(
                      label: "Entrar",
                      isLoading: controller.isLoading,
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          controller.save();
                        }
                      },
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
