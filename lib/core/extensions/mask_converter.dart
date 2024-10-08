extension MaskConverter on String? {
  String? toMask() {
    if (this == null) return null;
    return this!.replaceAll('#', '9').replaceAll('S', 'A');
  }
}
