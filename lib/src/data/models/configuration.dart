import 'dart:io';
import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:mala_api/src/factories/index.dart';

import '../enums/app_operation_mode.dart';

class Configuration {
  static bool isDebugMode = false;
  static AppOperationMode mode = AppOperationMode.hybrid;

  static void updateUrl(String url) {
    final newDio = Dio(BaseOptions(baseUrl: url));

    // Configure HttpClientAdapter to accept all certificates
    (newDio.httpClientAdapter as IOHttpClientAdapter).createHttpClient = () {
      final client = HttpClient();
      client.badCertificateCallback = (cert, host, port) => true;
      return client;
    };

    dio = newDio;
  }
}
