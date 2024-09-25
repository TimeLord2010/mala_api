import 'dart:io';

import 'get_patients_pictures_folder.dart';

/// Fetches the patient picture file object.
///
/// This method does not rely on network to work.
Future<File> getPictureFile(
  int patientId, {
  String? basePath,
}) async {
  basePath ??= await getPatientsPicturesFolder();
  return File('$basePath/$patientId.jpg');
}
