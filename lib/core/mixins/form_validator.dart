import 'package:grock/grock.dart';

import '../core.dart';

mixin FormValidator {
  String? isNotEmpty(String? value, [String? message]) {
    if (value == null || value.isEmpty) {
      return message ?? "Campo obrigatório";
    }

    return null;
  }

  String? isDocumentValid(String? value, [String? message]) {
    if (!value.cpfValid && !value.cnpjValid) {
      return message ?? "CPF inválido";
    }

    return null;
  }

  String? isEmailValid(String? value, [String? message]) {
    if(!value!.isEmail) {
      return message ?? "E-mail inválido";
    }

    return null;
  }

  String? equals(String? value, String? equal, [String? message]) {
    if (value != equal) {
      return message ?? "Os campos não conferem";
    }

    return null;
  }

  String? min(String? value, int length, [String? message]) {
    if (value!.length < length) {
      return message ?? "Mínimo de $length caracteres";
    }

    return null;
  }

  String? combine(List<String? Function()> validators) {
    for (final func in validators) {
      final validation = func();
      if (validation != null) return validation;
    }
    return null;
  }
}
