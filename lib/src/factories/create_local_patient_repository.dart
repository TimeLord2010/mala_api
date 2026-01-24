import 'package:mala_api/src/data/enums/app_operation_mode.dart';
import 'package:mala_api/src/data/models/configuration.dart';
import 'package:mala_api/src/factories/create_database_client.dart';
import 'package:mala_api/src/repositories/index.dart';

Future<LocalPatientRepository?> createLocalPatientRepository() async {
  return switch (Configuration.mode) {
    AppOperationMode.online => null,
    _ => LocalPatientRepository(await createDatabaseClient()),
  };
}
