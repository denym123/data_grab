import '../models/models.dart';

class SaveFamilyRequestDto {
  final ResponsibleModel? responsible;

  SaveFamilyRequestDto({
    required this.responsible,
  });

  Map<String, dynamic> toFishDeliveryJson() {
    return {
      "responsible": {
        "name": responsible?.name ?? '',
        "person_number": responsible?.personNumber ?? '',
        "document": responsible?.document ?? '',
        "birthday": responsible?.birthday ?? '',
        "nationality": responsible?.nationality ?? '',
        "community": responsible?.community ?? '',
        "zip": responsible?.zip ?? '',
        "city": responsible?.city ?? '',
        "street": responsible?.street ?? '',
        "neighborhood": responsible?.neighbourhood ?? '',
        "number": responsible?.number ?? '',
        "sex": responsible?.sex ?? '',
      }
    };
  }

  //List<Map<String, dynamic>> toJson(int familyId) {
  //  List<Map<String, dynamic>> people = [];
//
  //  people.add({
  //    "name": responsible?.name ?? '',
  //    "document": responsible?.document ?? '',
  //    "birthday": responsible?.birthday ?? '',
  //    "is_parent": 1,
  //    "nationality": responsible?.nationality ?? '',
  //    "community": responsible?.community ?? '',
  //    "zip": responsible?.zip ?? '',
  //    "city": responsible?.city ?? '',
  //    "street": responsible?.street ?? '',
  //    "neighborhood": responsible?.neighbourhood ?? '',
  //    "number": responsible?.number ?? '',
  //    "sex": responsible?.sex ?? '',
  //    "family_id": familyId,
  //  });

  // final dependentList = dependent!.map(
  //   (e) {
  //     return {
  //       "name": e.name ?? '',
  //       "document": e.document,
  //       "birthday": e.birthDay,
  //       "sex": e.sex,
  //       "community": e.community,
  //       "is_parent": 0,
  //       "family_id": familyId,
  //     };
  //   },
  // ).toList();

  // people.addAll(dependentList);

  // return people;
  //
}
