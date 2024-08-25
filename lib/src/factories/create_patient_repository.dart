import 'package:mala_api/src/data/interfaces/patient_interface.dart';

import '../data/enums/app_operation_mode.dart';
import '../data/models/configuration.dart';
import '../repositories/patient_repository/local_patient_repository.dart';
import 'create_database_client.dart';

Future<PatientInterface> createPatientRepository() async {
  return switch (Configuration.mode) {
    AppOperationMode.offline =>
      LocalPatientRepository(await createDatabaseClient()),
    _ => throw Exception('Not implemented'),
  };
}
