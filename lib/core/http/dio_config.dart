import 'package:dio/dio.dart';

const String _baseUrl = 'https://api-flutter-prova.hml.sesisenai.org.br';
const String _basePath = '/v1';

final dioApp = Dio(
  BaseOptions(
    baseUrl: '$_baseUrl/$_basePath',
    connectTimeout: const Duration(seconds: 12),
    receiveTimeout: const Duration(seconds: 12),
  ),
);
