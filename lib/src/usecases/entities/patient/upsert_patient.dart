import 'dart:async';
import 'dart:typed_data';

import 'package:vit_logger/vit_logger.dart';

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
  var patientId = patient.id;
  var stopWatch = VitStopWatch('upsertPatient:$patientId');
  var rep = await createPatientRepository();
  var result = await rep.upsert(patient);
  if (!ignorePicture) {
    await saveOrRemoveProfilePicture(
      patientId: result.id,
      data: pictureData,
    );
  }
  if (syncWithServer) {
    var future = sendChangesInBackground(patient).then((_) {
      onUpload?.call();
    }).catchError((err) {
      onUploadFail?.call(err);
    });
    if (waitForBackgroundUpload) {
      await future;
    }
  }
  stopWatch.stop();
  return result;
}
