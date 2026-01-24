import 'package:sqlite3/sqlite3.dart';

import '../database/database_client.dart';

Future<Database> createDatabaseClient() async {
  return await DatabaseClient.getInstance();
}

void destroyDatabaseClient() {
  DatabaseClient.close();
}
