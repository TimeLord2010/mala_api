import 'package:dio/dio.dart';
import 'package:mala_api/src/factories/index.dart';

import '../enums/app_operation_mode.dart';

class Configuration {
  static bool isDebugMode = false;
  static AppOperationMode mode = AppOperationMode.hybrid;

  static void updateUrl(String url) {
    dio = Dio(BaseOptions(
      baseUrl: url,
    ));
  }
}
