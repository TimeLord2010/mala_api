import 'dart:async';

import 'package:vit_logger/vit_logger.dart';

import '../../../data/entities/patient.dart';
import '../../../factories/create_patient_repository.dart';
import '../../../factories/logger.dart';
import '../../../factories/operation_permission.dart';
import 'api/background/send_deletion_in_background.dart';

Future<void> deletePatient(Patient patient) async {
  if (!operationPermission.deletePatient) {
    logger.warn('Aborted patient deletion due to operation permission');
    return;
  }

  var stopWatch = VitStopWatch('deletePatient');
  try {
    var rep = await createPatientRepository();
    var remoteId = patient.remoteId;
    if (remoteId != null) {
      unawaited(sendDeletionInBackground(remoteId));
      // await postPatientsChanges(
      //   deleted: [remoteId],
      // );
    }
    await rep.delete(patient);
  } finally {
    stopWatch.stop();
  }
}
