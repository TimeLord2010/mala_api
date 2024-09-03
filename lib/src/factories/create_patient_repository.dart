import 'package:mala_api/src/data/interfaces/patient_interface.dart';
import 'package:mala_api/src/repositories/index.dart';

import '../data/enums/app_operation_mode.dart';
import '../data/models/configuration.dart';
import 'create_database_client.dart';

Future<PatientInterface> createPatientRepository() async {
  return switch (Configuration.mode) {
    AppOperationMode.offline => await _createLocal(),
    AppOperationMode.hybrid => HybridPatientRepository(
        localRepository: await _createLocal(),
        onlineRepository: OnlinePatientRepository(),
      ),
    _ => throw Exception('Not implemented'),
  };
}

Future<LocalPatientRepository> _createLocal() async {
  var isar = await createDatabaseClient();
  return LocalPatientRepository(isar);
}
