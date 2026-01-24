import 'package:mala_api/mala_api.dart';

import '../../../../repositories/patient_api_repository.dart';
import '../profile_picture/get_picture_file.dart';

/// Update patient picture on the API.
Future<void> updateRemotePatientPicture(Patient patient) async {
  var logger = createSdkLogger('updateRemotePatientPicture');

  if (!Features.imageSuport) {
    logger.w('Image support not enabled to update patient picture');
    return;
  }
  var api = PatientApiRepository();
  var remoteId = patient.remoteId;
  if (remoteId == null) {
    throw Exception(
      'Não é possível atualizar foto de patiente no servidor sem um identificador.',
    );
  }
  var id = patient.id;
  var file = await getPictureFile(id);
  var exists = file.existsSync();
  if (exists) {
    logger.i('Updating patient picture in the API');
    await api.updatePicture(patientId: remoteId, file: file);
  } else {
    logger.i('Deleting patient picture in the API');
    await api.deletePicture(patientId: remoteId);
  }
}
