import 'dart:io';

import 'get_patients_pictures_folder.dart';

Future<File> getPictureFile(
  int patientId, {
  String? basePath,
}) async {
  basePath ??= await getPatientsPicturesFolder();
  return File('$basePath/$patientId.jpg');
}
