import '../core.dart';

class ExpressionEvaluator {
  // Função principal para avaliar a expressão
  bool evaluate(String expression, Map questions) {
    // Dividir a expressão em partes usando o delimitador '#'
    final parts = expression.split('#');
    return _evaluateParts(parts, questions, 0).result;
  }

  // Função recursiva para avaliar partes da expressão
  _EvaluationResult _evaluateParts(
      List<String> parts, Map questions, int index) {
    bool result = true;
    Operator? lastOperator;

    while (index < parts.length) {
      final part = parts[index];

      if (part.startsWith('Q[')) {
        final questionResult = _evaluateQuestion(parts, questions, index);
        index = questionResult.nextIndex;

        if (lastOperator != null) {
          result = _combineResults(result, questionResult.result, lastOperator);
        } else {
          result = questionResult.result;
        }

        lastOperator = null;
      } else if (part.startsWith('OP[')) {
        lastOperator =
            OperatorExtension.fromString(part.substring(3, part.indexOf(']')));
        index++;
      } else if (part == 'NULL' || part == 'NOTNULL') {
        final nullCheckResult = _evaluateNullCheck(parts, questions, index);
        index = nullCheckResult.nextIndex;

        if (lastOperator != null) {
          result =
              _combineResults(result, nullCheckResult.result, lastOperator);
        } else {
          result = nullCheckResult.result;
        }

        lastOperator = null;
      } else {
        index++;
      }
    }

    return _EvaluationResult(result, index);
  }

  // Função auxiliar para avaliar uma questão
  _EvaluationResult _evaluateQuestion(
      List<String> parts, Map questions, int index) {
    final endIndex = parts[index].indexOf(']');
    if (endIndex == -1) {
      throw FormatException(
          "Formato inválido: ']' não encontrado em ${parts[index]}");
    }

    final questionId = int.parse(parts[index].substring(2, endIndex));

    if (index + 1 >= parts.length) {
      throw FormatException(
          "Formato inválido: operador ou condição de nulo não encontrado após a questão ${parts[index]}");
    }

    final nextPart = parts[index + 1];
    if (nextPart == 'NULL' || nextPart == 'NOTNULL') {
      final nullCheckResult = _evaluateNullCheck(parts, questions, index + 1);
      return _EvaluationResult(
          nullCheckResult.result, nullCheckResult.nextIndex);
    }

    if (!nextPart.startsWith('OP[')) {
      throw FormatException(
          "Formato inválido: operador não encontrado após a questão ${parts[index]}");
    }

    final operatorStartIndex = nextPart.indexOf('[');
    final operatorEndIndex = nextPart.indexOf(']');
    if (operatorStartIndex == -1 || operatorEndIndex == -1) {
      throw FormatException(
          "Formato inválido: '[' ou ']' não encontrado em ${parts[index + 1]}");
    }

    final operator = OperatorExtension.fromString(
      nextPart.substring(operatorStartIndex + 1, operatorEndIndex),
    );

    final valueType = parts[index + 2][0];
    final valueEndIndex = parts[index + 2].indexOf(']');
    if (valueEndIndex == -1) {
      throw FormatException(
          "Formato inválido: ']' não encontrado em ${parts[index + 2]}");
    }

    String? value = parts[index + 2].substring(2, valueEndIndex);
    dynamic questionValue = questions[questionId].value.id;
    dynamic comparisonValue;

    if (valueType == 'C' || valueType == 'O') {
      comparisonValue = int.tryParse(value) ?? value;
    } else if (valueType == 'L') {
      comparisonValue =
          value.split(',').map((e) => int.tryParse(e) ?? e).toList();
    }

    bool result = _evaluateCondition(questionValue, operator, comparisonValue);
    return _EvaluationResult(result, index + 3);
  }

  // Função auxiliar para avaliar uma condição de NULL ou NOTNULL
  _EvaluationResult _evaluateNullCheck(
      List<String> parts, Map questions, int index) {
    final isNullCheck = parts[index] == 'NULL';
    final questionId =
        int.parse(parts[index - 1].substring(2, parts[index - 1].indexOf(']')));
    dynamic questionValue = questions[questionId].value.id;

    bool result = isNullCheck ? questionValue == null : questionValue != null;
    return _EvaluationResult(result, index + 1);
  }

  // Função auxiliar para combinar resultados usando operadores lógicos
  bool _combineResults(bool result1, bool result2, Operator operator) {
    if (operator == Operator.and) {
      return result1 && result2;
    } else if (operator == Operator.or) {
      return result1 || result2;
    } else {
      throw ArgumentError('Operador lógico desconhecido: $operator');
    }
  }

  // Função auxiliar para avaliar uma condição individual
  bool _evaluateCondition(
      dynamic questionValue, Operator operator, dynamic comparisonValue) {
    switch (operator) {
      case Operator.greaterThan:
        return questionValue > comparisonValue;
      case Operator.greaterThanOrEqual:
        return questionValue >= comparisonValue;
      case Operator.lessThan:
        return questionValue < comparisonValue;
      case Operator.lessThanOrEqual:
        return questionValue <= comparisonValue;
      case Operator.equal:
        return questionValue == comparisonValue;
      case Operator.notEqual:
        return questionValue != comparisonValue;
      case Operator.contains:
        return comparisonValue is List &&
            comparisonValue.contains(questionValue);
      case Operator.containedIn:
        return questionValue is List && questionValue.contains(comparisonValue);
      case Operator.notContains:
        return comparisonValue is List &&
            !comparisonValue.contains(questionValue);
      default:
        throw ArgumentError('Operador desconhecido: $operator');
    }
  }
}

// Classe auxiliar para armazenar o resultado da avaliação e o próximo índice
class _EvaluationResult {
  final bool result;
  final int nextIndex;

  _EvaluationResult(this.result, this.nextIndex);
}
