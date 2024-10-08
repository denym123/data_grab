import 'package:dio/dio.dart' as dio;

import '../../core.dart';

abstract class HttpAdapter {
  Future<dio.Response?> request({
    required HttpMethod httpMethod,
    required String url,
    required bool needsAuthorization,
    bool needsCredentials = false,
    bool refreshAuthorization = false,
    bool throwException = true,
    dynamic data,
    String? pathFile,
  });
}
