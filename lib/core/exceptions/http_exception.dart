import 'dart:convert';

import 'package:dio/dio.dart';

class HttpException implements Exception {
  final String? url;
  final DioException? dioException;
  final dynamic data;

  HttpException({
    required this.url,
    required this.dioException,
    this.data,
  });

  @override
  String toString() {
    return '[HTTP Exception]\n'
        'URL: $url\n'
        'statusCode: ${dioException?.response?.statusCode}\n'
        'Data: ${jsonEncode(data)}\n'
        'Type: ${dioException?.type}';
  }

  String? get message {
    try {
      return dioException?.response?.data['message'];
    } catch (_) {}

    return null;
  }

  int? get statusCode => dioException?.response?.statusCode;

  Map<String, dynamic>? get request => dioException?.requestOptions.data;

  Map<String, dynamic>? get response => dioException?.response?.data;

  Map<String, dynamic>? get errors => dioException?.response?.data['errors'];

  String? get type => dioException?.type.toString();
}
