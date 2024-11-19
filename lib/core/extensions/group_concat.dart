import 'dart:convert';

extension GroupConcatStringExtension on String {
  /// Transforma uma String formatada como JSON ou estilo "key:value,key2:value2"
  /// em um Map<String, dynamic>.
  Map<String, dynamic> toJsonMap() {
    try {
      // Remove espaços extras
      String trimmed = this.trim();

      // Verifica se já é um JSON válido
      if (trimmed.startsWith('{') && trimmed.endsWith('}')) {
        return jsonDecode(trimmed);
      }

      // Converte string "key:value,key2:value2" para Map<String, dynamic>
      var pairs = trimmed.split(',');
      Map<String, dynamic> jsonMap = {};

      for (var pair in pairs) {
        var keyValue = pair.split(':');
        if (keyValue.length == 2) {
          var key = keyValue[0].trim();
          var value = keyValue[1].trim();

          // Tentativa de converter valores numéricos ou booleanos
          if (value == 'true') {
            jsonMap[key] = true;
          } else if (value == 'false') {
            jsonMap[key] = false;
          } else if (double.tryParse(value) != null) {
            jsonMap[key] = double.parse(value);
          } else {
            jsonMap[key] = value; // Trata como string se não for número ou booleano
          }
        }
      }
      return jsonMap;
    } catch (e) {
      throw FormatException('Erro ao converter string para JSON: ${e.toString()}');
    }
  }
}

extension GroupConcatListStringExtension on String {
  /// Converte uma String formatada como uma lista de JSONs ou estilo "key:value|key:value"
  /// em uma lista de Map<String, dynamic>.
  List<Map<String, dynamic>> toJsonMapList() {
    try {
      // Remove espaços extras
      String trimmed = this.trim();

      // Verifica se já está no formato de uma lista JSON
      if (trimmed.startsWith('[') && trimmed.endsWith(']')) {
        return List<Map<String, dynamic>>.from(jsonDecode(trimmed));
      }

      // Trata o formato estilo "key:value|key:value"
      List<String> mapStrings = trimmed.split('|');
      List<Map<String, dynamic>> jsonMapList = [];

      for (var mapString in mapStrings) {
        var pairs = mapString.split(',');
        Map<String, dynamic> jsonMap = {};

        for (var pair in pairs) {
          var keyValue = pair.split(':');
          if (keyValue.length == 2) {
            var key = keyValue[0].trim();
            var value = keyValue[1].trim();

            // Tentativa de converter valores numéricos ou booleanos
            if (value == 'true') {
              jsonMap[key] = true;
            } else if (value == 'false') {
              jsonMap[key] = false;
            } else if (double.tryParse(value) != null) {
              jsonMap[key] = double.parse(value);
            } else {
              jsonMap[key] = value; // Trata como string se não for número ou booleano
            }
          }
        }
        jsonMapList.add(jsonMap);
      }
      return jsonMapList;
    } catch (e) {
      throw FormatException('Erro ao converter string para lista de mapas: ${e.toString()}');
    }
  }
}
