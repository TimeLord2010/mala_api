import 'dart:io';

import 'package:vit_dart_extensions/vit_dart_extensions_io.dart';

import '../../factories/logger.dart';
import '../object/error/get_error_message.dart';
import 'get_database_directory.dart';

Future<void> deleteDatabaseFiles() async {
  var logger = createSdkLogger('deleteDatabaseFiles');

  var isar = await createDatabaseClient();
  String? filePath = isar.path;
  await isar.close(deleteFromDisk: true);
  if (filePath != null) {
    logger.i('Database file: $filePath');
    var file = File(filePath);
    bool exists = file.existsSync();
    if (exists) {
      try {
        await file.delete();
      } catch (e) {
        logger.e('Failed to delete database file: ${getErrorMessage(e)}');
      }
    }
  }
  destroyDatabaseClient();
  var dir = await getDatabaseDirectory();
  var files = dir.listDirectoryFiles();
  files.listen((event) async {
    var path = event.getName(true);
    if (path.contains('.isar')) {
      logger.w('Deleting database file: $path');
      event.deleteSync();
    } else {
      logger.i('Did NOT delete file: $path');
    }
  });
}
