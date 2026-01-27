import 'dart:io';

import 'package:vit_dart_extensions/vit_dart_extensions.dart';

import '../../../factories/http_client.dart';
import '../../../factories/logger.dart';
import '../../object/error/get_error_message.dart';

Future<void> insertRemoteLog({
  required String message,
  String? stack,
  String? context,
  Map<String, dynamic>? extras,
  String level = 'info',
}) async {
  var logger = createSdkLogger('insertRemoteLog');

  try {

    var virtualMemorySize = getVirtualMemorySize();
    await dio.post(
      '/log',
      data: {
        'context': context,
        'message': message,
        'level': level,
        if (stack != null) ...{'stack': stack},
        'extras': {
          'cpus': Platform.numberOfProcessors,
          'platform': Platform.operatingSystem,
          if (extras != null) ...extras,
        },
      },
    );
  } catch (e) {
    var msg = getErrorMessage(e) ?? 'Falha ao enviar logs';
    logger.e('(insertRemoteLog) $msg');
  }
}
