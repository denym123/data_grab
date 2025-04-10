import 'package:data_grab/core/data_base/data_base.dart';
import 'package:data_grab/modules/delivery/dtos/save_family_request_dto.dart';

class DeliveryRepository {
  Future<void> saveOnlyResponsible(SaveFamilyRequestDto people) async {
    var conn = await SqliteConnectionFactory().openConnection();

    await conn.insert("responsible", people.toFishDeliveryJson());
  }

  Future<int> saveFamily(Map<String, dynamic> interviewer) async {
    var conn = await SqliteConnectionFactory().openConnection();

    return await conn.insert("family", interviewer);
  }
}
