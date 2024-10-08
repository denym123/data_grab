import 'dart:convert';
import 'dart:math';

import 'package:crypto/crypto.dart';

class Hash {
  static String generateHash() {
    final random = Random.secure();
    final values = List<int>.generate(16, (i) => random.nextInt(256));

    String randomString = base64Url.encode(values);

    String timestamp = DateTime.now().millisecondsSinceEpoch.toString();
    String combinedString = randomString + timestamp;

    var bytes = utf8.encode(combinedString);
    var digest = sha256.convert(bytes);

    return digest.toString();
  }
}
