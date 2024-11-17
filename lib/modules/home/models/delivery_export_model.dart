import 'package:data_grab/modules/home/models/person_model.dart';

class DeliveryExportModel {
  final String familyId;
  final String responsibleName;
  final String responsibleDocument;
  final List<PersonModel> children;

  DeliveryExportModel({
    required this.familyId,
    required this.responsibleName,
    required this.responsibleDocument,
    required this.children,
  });

  DeliveryExportModel.fromJson(Map<String, dynamic> json)
      : familyId = json['family_id'],
        responsibleName = json['responsible_name'],
        responsibleDocument = json['responsible_document'],
        children = (json['children'] as List<dynamic>)
            .map((e) => PersonModel.fromJson(e))
            .toList();

}
