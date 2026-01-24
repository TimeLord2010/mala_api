import 'dart:async';
import 'dart:typed_data';

import 'package:mala_api/src/factories/create_local_patient_repository.dart';
import 'package:mala_api/src/repositories/patient_repository/local_patient_repository.dart';

import '../../../data/entities/patient.dart';
import '../../../factories/create_patient_repository.dart';
import 'api/background/send_changes_in_background.dart';
import 'profile_picture/save_or_remove_profile_picture.dart';

Future<Patient> upsertPatient(
  Patient patient, {
  Uint8List? pictureData,
  bool syncWithServer = true,
  bool ignorePicture = false,
  bool waitForBackgroundUpload = false,
  void Function()? onUpload,
  void Function(Object err)? onUploadFail,
}) async {
  // Upserting patient
  //
  // We don't use the regular patient repository factory because it cannot
  // send patient to server in the background.
  LocalPatientRepository? rep = await createLocalPatientRepository();
  Patient result;
  if (rep != null) {
    result = await rep.upsert(patient);
  } else {
    var onlineRep = await createPatientRepository();
    result = await onlineRep.upsert(patient);
  }

  // Updating picture locally
  if (!ignorePicture) {
    await saveOrRemoveProfilePicture(patientId: result.id, data: pictureData);
  }

  // Checks if the patient needs to be sent to the server.
  if (syncWithServer && rep != null) {
    var future = sendChangesInBackground(patient)
        .then((_) {
          onUpload?.call();
        })
        .catchError((err) {
          onUploadFail?.call(err);
        });
    if (waitForBackgroundUpload) {
      await future;
    }
  }

  return result;
}
