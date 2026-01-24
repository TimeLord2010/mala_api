import 'dart:async';

import '../../../data/entities/patient.dart';
import '../../../factories/create_patient_repository.dart';
import '../../../factories/logger.dart';
import '../../../factories/operation_permission.dart';
import 'api/background/send_deletion_in_background.dart';

Future<void> deletePatient(
  Patient patient, {
  void Function()? onUpload,
  void Function(Object err)? onUploadError,
}) async {
  var logger = createSdkLogger('deletePatient');

  if (!operationPermission.deletePatient) {
    logger.w('Aborted patient deletion due to operation permission');
    return;
  }

  var rep = await createPatientRepository();
  var remoteId = patient.remoteId;
  if (remoteId != null) {
    unawaited(
      sendDeletionInBackground(remoteId)
          .then((_) {
            onUpload?.call();
          })
          .catchError((err) {
            onUploadError?.call(err);
          }),
    );
    // await postPatientsChanges(
    //   deleted: [remoteId],
    // );
  }
  await rep.delete(patient);
}
