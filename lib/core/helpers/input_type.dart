import 'package:flutter/widgets.dart';

class InputGetter {
  InputGetter._();

  static TextInputType get(String? inputType) {
    return TextInputType.values.singleWhere(
          (element) {
        return element.toString().split('.').last.split(',').first == inputType;
      },
      orElse: () => TextInputType.text,
    );
  }
}
