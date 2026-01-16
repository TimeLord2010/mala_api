import 'dart:io';
import 'package:dio/dio.dart';
import 'package:dio/io.dart';

// Helper function to create Dio client with certificate bypass
Dio _createDioClient(String baseUrl) {
  final dio = Dio(BaseOptions(baseUrl: baseUrl));

  // Configure HttpClientAdapter to accept all certificates
  (dio.httpClientAdapter as IOHttpClientAdapter).createHttpClient = () {
    final client = HttpClient();
    client.badCertificateCallback = (cert, host, port) => true;
    return client;
  };

  return dio;
}

// Initialize with certificate bypass
var dio = _createDioClient(
  'https://aj18h1vzgh.execute-api.us-east-1.amazonaws.com/Prod/',
);
