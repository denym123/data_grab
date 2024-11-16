import 'package:data_grab/core/extensions/json_array.dart';

class Delivery {
  int? familyId;
  String? responsibleName;
  String? responsibleDocument;
  List<String>? children;


  Delivery({
    this.familyId,
    this.responsibleName,
    this.responsibleDocument,
    this.children,
  });

  factory Delivery.fromJson(Map<String, dynamic> json) {

    return Delivery(
        familyId: json['family_id'],
        responsibleName: json['responsible_name'],
        responsibleDocument: json['responsible_document'],
        children: (json['children'] as String).toStringList());
  }
}
