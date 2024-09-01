import 'package:mala_api/src/factories/create_patient_repository.dart';
import 'package:mala_api/src/repositories/patient_repository/hybrid_patient_repository.dart';

Future<void> fetchChangedPatients({
  void Function(String? lastSync)? updater,
  bool Function()? didCancel,
}) async {
  var rep = await createPatientRepository();
  if (rep is! HybridPatientRepository) {
    return;
  }
  await rep.updatePatientsFromServer(
    updater: updater,
    didCancel: didCancel,
  );
}
