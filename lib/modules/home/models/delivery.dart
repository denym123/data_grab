class Delivery {
  String createdAt;
  String responsibleId;
  String responsibleName;
  String responsibleDocument;
  int dependentNumber;

  Delivery({
    required this.responsibleId,
    required this.createdAt,
    required this.responsibleName,
    required this.responsibleDocument,
    required this.dependentNumber,
  });

  factory Delivery.fromJson(Map<String, dynamic> json) {
    return Delivery(
      responsibleId: json['responsible_id'],
      createdAt: json['created_at'],
      responsibleName: json['user_name'],
      responsibleDocument: json['user_document'],
      dependentNumber: json['dependent_number'],
    );
  }
}
