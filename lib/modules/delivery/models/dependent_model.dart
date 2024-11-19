class DependentModel {
  int? id;
  String? name;
  String? document;
  String? birthDay;
  String? sex;
  String? community;
  int? familyId;

  DependentModel({
    this.id,
    required this.name,
    required this.familyId,
    required this.document,
    required this.birthDay,
    required this.sex,
    required this.community,
  });
}
