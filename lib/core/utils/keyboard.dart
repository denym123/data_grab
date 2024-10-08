import 'package:flutter/services.dart';

void closeKeyboard() {
  SystemChannels.textInput.invokeMethod('TextInput.hide');
}
