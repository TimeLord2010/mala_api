import 'package:vit_dart_extensions/vit_dart_extensions_io.dart';

import '../../database/database_client.dart';
import '../../factories/logger.dart';
import 'get_database_directory.dart';

Future<void> deleteDatabaseFiles() async {
  var logger = createSdkLogger('deleteDatabaseFiles');

  // Close and delete using DatabaseClient
  await DatabaseClient.deleteDatabase();

  // Clean up any remaining SQLite files
  var dir = await getDatabaseDirectory();
  var files = dir.listDirectoryFiles();
  files.listen((event) async {
    var path = event.getName(true);
    // SQLite creates .db, .db-shm, .db-wal files
    if (path.contains('.db')) {
      logger.w('Deleting database file: $path');
      event.deleteSync();
    } else {
      logger.i('Did NOT delete file: $path');
    }
  });
}
