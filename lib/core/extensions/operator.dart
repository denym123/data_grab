import '../core.dart';

extension OperatorExtension on Operator {
  // Método para converter uma string em um valor do enum Operator
  static Operator fromString(String operator) {
    switch (operator) {
      case '>':
        return Operator.greaterThan;
      case '>=':
        return Operator.greaterThanOrEqual;
      case '<':
        return Operator.lessThan;
      case '<=':
        return Operator.lessThanOrEqual;
      case '=':
        return Operator.equal;
      case '!=':
        return Operator.notEqual;
      case '@>':
        return Operator.contains;
      case '<@>':
        return Operator.containedIn;
      case '!@>':
        return Operator.notContains;
      case 'AND':
        return Operator.and;
      case 'OR':
        return Operator.or;
      default:
        throw ArgumentError('Operador desconhecido: $operator');
    }
  }
}
