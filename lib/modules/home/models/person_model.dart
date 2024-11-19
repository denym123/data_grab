class PersonModel {
  int? id;
  String? name;
  String? document;
  String? birthday;
  String? sex;
  String? nationality;
  int? isParent;
  String? community;
  String? zip;
  String? city;
  String? street;
  String? neighborhood;
  PersonModel({
    this.nationality,
    this.id,
    this.name,
    this.document,
    this.birthday,
    this.sex,
    this.isParent,
    this.street,
    this.neighborhood,
    this.community,
    this.zip,
    this.city,
  });

  factory PersonModel.fromJson(Map<String, dynamic> json) {
    return PersonModel(
      id: json['id'],
      name: json['name'],
      document: json['document'],
      birthday: json['birthday'],
      community: json['community'],
      nationality: json['nationality'],
      sex: json['sex'],
      isParent: json['is_parent'],
      zip: json['zip'],
      city: json['city'],
      street: json['street'],
      neighborhood: json['neighborhood'],
    );
  }
}

//"id":4,
//"name":"Domepoqm",
//"document":"931.039.992-91",
//"birthday":"03/12/2004",
//"sex":"aikana",
//"is_parent":1,
//"ethnicity":"",
//"community":"0319392",
//"zip":"69309-650",
//"city":"CIdade",
//"street":"Rua",
//"family_id":2
