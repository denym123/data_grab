extension Brackets on String {
  String? stripBrackets() {
    String first = this[0];
    String last = this[length - 1];

    if (first == '[' && last == ']') {
      return substring(1, length - 1);
    }

    return this;
  }
}
