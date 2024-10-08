import '../core.dart';

extension CpfCnpj on String? {
  bool get cpfValid {
    return CPFValidator.isValid(this);
  }

  bool get cnpjValid {
    return CNPJValidator.isValid(this);
  }

  String strip() {
    return CPFValidator.strip(this);
  }
}