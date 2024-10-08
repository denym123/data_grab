class MaskHelper {
  static List<String> parseMasks(String maskString) {
    // Remove os colchetes e espaços em branco
    String cleanedString = maskString.replaceAll(RegExp(r'^.|.$'), '');

    // Divide a string em uma lista de máscaras
    List<String> masks = cleanedString.split(',');

    return masks;
  }
}
