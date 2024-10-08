extension Capitalization on String {
  String capitalize() {
    if (isEmpty) {
      return this;
    }
    String word = trim();
    word = replaceAll(RegExp(r"\s+"), " ");
    List<String> words = word.split(" ");
    for (int i = 0; i < words.length; i++) {
      String word = words[i];
      if (word.isNotEmpty) {
        words[i] = "${word[0].toUpperCase()}${word.substring(1).toLowerCase()}";
      }
    }
    return words.join(" ");
  }
}
