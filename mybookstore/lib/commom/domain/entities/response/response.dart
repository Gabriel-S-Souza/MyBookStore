class ResponseApp {
  final dynamic data;
  final int statusCode;

  ResponseApp({
    required this.data,
    int? statusCode = 0,
  }) : statusCode = statusCode ?? 0;

  bool get isOk => statusCode >= 200 && statusCode < 300;
}
