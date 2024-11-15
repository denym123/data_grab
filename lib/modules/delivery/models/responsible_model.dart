class ResponsibleModel {
  final int? id;
  final String name;
  final String document;
  final String birthday;
  final String nationality;
  final String? community;
  final String? zip;
  final String city;
  final String neighbourhood;
  final String street;

  ResponsibleModel({
    required this.neighbourhood,
    this.id,
    required this.nationality,
    required this.birthday,
    required this.community,
    required this.zip,
    required this.city,
    required this.street,
    required this.name,
    required this.document,
  });
}
