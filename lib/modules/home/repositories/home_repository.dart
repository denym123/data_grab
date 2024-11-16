import 'package:data_grab/core/core.dart';
import 'package:data_grab/core/data_base/data_base.dart';

import '../home.dart';

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
            '''
    );
    return query
        .toList()
        .map(
          (e) => Delivery.fromJson(e),
        )
        .toList();
  }
}
