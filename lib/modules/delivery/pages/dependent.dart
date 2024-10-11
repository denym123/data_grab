import 'package:flutter/material.dart';

import '../controllers/controllers.dart';

class Dependent extends StatelessWidget {
  final DeliveryController controller;

  const Dependent({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Text("Dependente"),
      ],
    );
  }
}
