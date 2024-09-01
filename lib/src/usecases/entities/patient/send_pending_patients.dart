import 'package:mala_api/src/factories/create_patient_repository.dart';

import '../../../repositories/patient_repository/hybrid_patient_repository.dart';

/// Sends the pending patients to the API.
///
/// Only does anything if the operation mode is set to hybrid.
Future<void> sendPendingPatients() async {
  var rep = await createPatientRepository();
  if (rep is! HybridPatientRepository) {
    return;
  }
  await rep.sendAllToApi();
}
