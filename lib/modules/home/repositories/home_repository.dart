import 'package:data_grab/core/core.dart';
import 'package:data_grab/core/data_base/data_base.dart';

import '../home.dart';

class HomeRepository {
  Future<List<Delivery>> fetchDeliveries() async {
    var conn = await SqliteConnectionFactory().openConnection();
    var query = await conn.query('SELECT * FROM delivery');
    return query
        .toList()
        .map(
          (e) => Delivery.fromJson(e),
        )
        .toList();
  }
}
