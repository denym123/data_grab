class ResponsibleModel {
  int? id;
  int? familyId;
  String name;
  String document;
  String birthday;
  String nationality;
  String? community;
  String? sex;
  String? zip;
  String city;
  String neighbourhood;
  String street;

  ResponsibleModel({
    required this.sex,
    required this.neighbourhood,
    this.id,
    required this.nationality,
    required this.birthday,
    required this.familyId,
    required this.community,
    required this.zip,
    required this.city,
    required this.street,
    required this.name,
    required this.document,
  });
}
