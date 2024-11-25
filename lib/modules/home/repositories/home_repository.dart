import 'package:data_grab/core/core.dart';
import 'package:data_grab/core/data_base/data_base.dart';

import '../home.dart';
import '../models/delivery_export_model.dart';

class HomeRepository {
  Future<List<Delivery>> fetchDeliveries() async {
    var conn = await SqliteConnectionFactory().openConnection();
    var query = await conn.rawQuery('''
SELECT 
    f.id AS family_id,
    p_parent.name AS responsible_name,
    p_parent.document AS responsible_document,
    '[' || GROUP_CONCAT('"' || p_child.name || '"') || ']' AS children
FROM 
    family f
JOIN 
    person p_parent ON f.id = p_parent.family_id AND p_parent.is_parent = 1
LEFT JOIN 
    person p_child ON f.id = p_child.family_id AND p_child.is_parent = 0
GROUP BY 
    f.id, p_parent.name, p_parent.document;
            ''');
    return query
        .toList()
        .map(
          (e) => Delivery.fromJson(e),
        )
        .toList();
  }

  Future<List<DeliveryExportModel>> getCompleteDeliveries() async {
    var conn = await SqliteConnectionFactory().openConnection();
    var query = await conn.rawQuery('''
SELECT 
    f.id AS family_id,
    f.created_at,
    f.interviewer_name,
    f.interviewer_document,
    '[' || 
    IFNULL(GROUP_CONCAT(
        '{"id":' || IFNULL(p.id, 'null') || 
        ',"name":"' || IFNULL(p.name, '') || '"' ||
        ',"document":"' || IFNULL(p.document, '') || '"' ||
        ',"birthday":"' || IFNULL(p.birthday, '') || '"' ||
        ',"sex":"' || IFNULL(p.sex, '') || '"' ||
        ',"is_parent":' || IFNULL(p.is_parent, '0') ||
        ',"community":"' || IFNULL(p.community, '') || '"' ||
        ',"nationality":"' || IFNULL(p.nationality, '') || '"' ||
        ',"zip":"' || IFNULL(p.zip, '') || '"' ||
        ',"city":"' || IFNULL(p.city, '') || '"' ||
        ',"street":"' || IFNULL(p.street, '') || '"' ||
        ',"neighborhood":"' || IFNULL(p.neighborhood, '') || '"' ||
        ',"number":"' || IFNULL(p.number, '') || '"' ||
        ',"family_id":' || IFNULL(p.family_id, 'null') || '}'
    ), '') || 
    ']' AS family
FROM 
    family f
LEFT JOIN 
    person p ON f.id = p.family_id
GROUP BY 
    f.id, f.interviewer_name, f.interviewer_document;
     ''');
    return query
        .toList()
        .map(
          (e) => DeliveryExportModel.fromJson(e),
        )
        .toList();
  }
}
