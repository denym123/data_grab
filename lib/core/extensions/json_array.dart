import 'dart:convert';

extension JsonArray on String {
  /// Transforma uma string JSON como "[\"Nome\"]" em uma lista de strings
  List<String> toStringList() {
    try {
      // Substitui os caracteres desnecessários e converte em JSON
      String cleanedInput = this.replaceAll(r'\"', '"').replaceAll('/"', '"').replaceAll('"/', '"');
      return List<String>.from(jsonDecode(cleanedInput));
    } catch (e) {
      throw FormatException('A string fornecida não é um JSON válido: $this');
    }
  }
}