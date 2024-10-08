import 'package:data_grab/core/ui/widgets/default_input_field.dart';
import 'package:flutter/material.dart';

import '../../core/core.dart';
import 'login.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => LoginPageState();
}

class LoginPageState extends PageLifeCycleState<LoginController, LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Text(
              "Insira seu nome completo e CPF para registrar seus nomes nas entregas.",
              style: context.textStyles.bold16,
            ),
            SizedBox(height: 44.h),
            DefaultInputField(
              label: "Nome completo",
              controller: TextEditingController(),
            ),
          ],
        ),
      ),
    );
  }
}
