import '../models/models.dart';

class SaveFamilyRequestDto {
  final List<DependentModel>? dependent;
  final ResponsibleModel? responsible;

  SaveFamilyRequestDto({
    required this.dependent,
    required this.responsible,
  });

  List<Map<String, dynamic>> toJson(int familyId) {

    List<Map<String,dynamic>> people = [];

    people.add({
      "name": responsible?.name ?? '',
      "document": responsible?.document ?? '',
      "birthday": responsible?.birthday ?? '',
      "is_parent": 1,
      "community": responsible?.community ?? '',
      "zip": responsible?.zip ?? '',
      "city": responsible?.city ?? '',
      "street": responsible?.street ?? '',
      "neighbourhood": responsible?.neighbourhood ?? '',
      "sex": responsible?.sex ?? '',
      "family_id": familyId,
    });

    final dependentList = dependent!.map(
      (e) {
        return {
          "name": e.name ?? '',
          "document": e.document,
          "birthday": e.birthDay,
          "sex": e.sex,
          "community": e.community,
          "is_parent": 0,
          "family_id": familyId,
        };
      },
    ).toList();

    people.addAll(dependentList);

    return people;
  }
}
