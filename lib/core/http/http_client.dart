// ignore_for_file: avoid_catches_without_on_clauses

import 'package:dio/dio.dart';

import '../commom/domain/entities/failure.dart';

class HttpClient {
  final Dio _dio;

  HttpClient(this._dio) {
    _addInterceptor();
  }

  Future<Response> get(String url) async {
    try {
      final response = await _dio.get(url);
      return response;
    } catch (e) {
      throw _handleError(e);
    }
  }

  Failure _handleError(Object e) {
    if (e is! DioError) return NotFoundFailure(e.toString());

    switch (e.type) {
      case DioErrorType.connectionTimeout:
        return OfflineFailure();
      case DioErrorType.cancel:
      case DioErrorType.receiveTimeout:
      case DioErrorType.badResponse:
        return ServerFailure(e.message.toString());
      default:
        return NotFoundFailure(e.message.toString());
    }
  }

  void _addInterceptor() {
    _dio.interceptors.add(LogInterceptor(
      requestBody: true,
      responseBody: true,
    ));
  }
}
