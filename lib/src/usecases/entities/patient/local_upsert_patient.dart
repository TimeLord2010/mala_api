import 'package:mala_api/mala_api.dart';
import 'package:mala_api/src/factories/create_local_patient_repository.dart';

Future<void> localUpsertPatient(Patient patient) async {
  var localRep = await createLocalPatientRepository();
  if (localRep == null) return;

  await localRep.upsert(patient);
}
