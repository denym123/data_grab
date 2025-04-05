class Delivery {
  String? responsibleName;
  String? responsibleDocument;
  String? personNumber;
  DateTime? createdAt;

  Delivery(
      {this.responsibleName,
      this.createdAt,
      this.responsibleDocument,
      this.personNumber});

  factory Delivery.fromJson(Map<String, dynamic> json) {
    return Delivery(
      responsibleName: json['responsible_name'],
      createdAt: DateTime.parse(json['created_at']),
      personNumber: json['person_number'],
      responsibleDocument: json['responsible_document'],
    );
  }
}
