import 'package:mala_api/src/usecases/entities/patient/local_upsert_patient.dart';

import '../../../../data/entities/patient.dart';

Future<void> assignRemoteIdToPatient(Patient patient, String remoteId) async {
  patient.remoteId = remoteId;
  patient.uploadedAt = DateTime.now();
  await localUpsertPatient(patient);
}
