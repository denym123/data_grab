extension VersionExtension on String {
  String removeEnvironment() {
    return replaceAll(".dev", "").replaceAll(".hom", "");
  }
}
