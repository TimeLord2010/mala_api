import '../../../../data/entities/patient.dart';
import '../../../../data/models/features.dart';
import '../../../../repositories/patient_api_repository.dart';
import '../profile_picture/get_picture_file.dart';

/// Update patient picture on the API.
Future<void> updateRemotePatientPicture(Patient patient) async {
  if (!Features.imageSuport) {
    return;
  }
  var api = PatientApiRepository();
  var remoteId = patient.remoteId;
  if (remoteId == null) {
    throw Exception(
        'Não é possível atualizar foto de patiente no servidor sem um identificador.');
  }
  var id = patient.id;
  var file = await getPictureFile(id);
  var exists = file.existsSync();
  if (exists) {
    await api.updatePicture(
      patientId: remoteId,
      file: file,
    );
  } else {
    await api.deletePicture(
      patientId: remoteId,
    );
  }
}
