import 'dart:convert';

import 'package:data_grab/core/extensions/group_concat.dart';
import 'package:data_grab/modules/home/models/person_model.dart';
import 'package:data_grab/core/core.dart';

class DeliveryExportModel {
  final int? familyId;
  final String? interviewerName;
  final String? interviewerDocument;
  final List<PersonModel> children;
  final String? createdAt;

  DeliveryExportModel({
    required this.familyId,
    required this.interviewerName,
    required this.interviewerDocument,
    required this.children,
    required this.createdAt,
  });

  factory DeliveryExportModel.fromJson(Map<String, dynamic> json) {
    return DeliveryExportModel(
      createdAt: json['created_at'],
      familyId: json['family_id'],
      interviewerName: json['interviewer_name'],
      interviewerDocument: json['interviewer_document'],
      children: (json['family'] as String).toJsonMapList()
          .map((e) => PersonModel.fromJson(e))
          .toList(),
    );
  }


}
