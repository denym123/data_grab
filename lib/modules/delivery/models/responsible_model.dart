class ResponsibleModel {
  int? id;
  String? personNumber;
  String? createdAt;
  String? interviewerName;
  String? interviewerDocument;
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
  String? number;

  ResponsibleModel({
    required this.sex,
    required this.neighbourhood,
    this.id,
    required this.personNumber,
    required this.nationality,
    required this.birthday,
    required this.createdAt,
    required this.interviewerName,
    required this.interviewerDocument,
    required this.community,
    required this.zip,
    required this.city,
    required this.street,
    required this.name,
    required this.document,
    this.number,
  });
}
