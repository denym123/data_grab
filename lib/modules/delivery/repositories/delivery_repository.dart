import 'package:data_grab/core/data_base/data_base.dart';
import 'package:data_grab/modules/delivery/dtos/save_family_request_dto.dart';

class DeliveryRepository {
  // Future<void> saveResponsibleAndDependents(SaveFamilyRequestDto people, int familyId) async {
  //   var conn = await SqliteConnectionFactory().openConnection();
  //   for (var person in people.toJson(familyId)) {
  //     await conn.insert("person", person);
  //   }
  // }

  Future<void> saveOnlyResponsible(SaveFamilyRequestDto people) async {
    var conn = await SqliteConnectionFactory().openConnection();

    conn.insert("responsible", people.toFishDeliveryJson());
  }

  Future<int> saveFamily(Map<String, dynamic> interviewer) async {
    var conn = await SqliteConnectionFactory().openConnection();

    return await conn.insert("family", interviewer);
  }
}
