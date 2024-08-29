import 'dart:async';

import 'package:mala_api/src/factories/logger.dart';

import '../../../../data/interfaces/patient_interface.dart';
import '../../../../repositories/patient_repository/hybrid_patient_repository.dart';
import '../../../object/error/get_error_message.dart';

///
Future<void> sendLocalPatientsToServer({
  required PatientInterface rep,
}) async {
  if (rep is HybridPatientRepository) {
    try {
      await rep.sendAllToApi();
    } on Exception catch (e) {
      var msg = getErrorMessage(e) ?? 'Falha na sincronização';
      logger.error(msg);
    }
  }
}
