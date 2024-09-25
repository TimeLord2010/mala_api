import 'dart:io';
import 'dart:typed_data';

import 'package:mala_api/src/usecases/entities/patient/profile_picture/get_picture_file.dart';

import '../../../../factories/logger.dart';

/// Updates the patient picture.
///
/// If no data is given, the file is deleted, otherwise, the data is saved to
/// to the local storage.
Future<void> saveOrRemoveProfilePicture({
  required int patientId,
  required Uint8List? data,
  Directory? dir,
}) async {
  var file = await getPictureFile(
    patientId,
    basePath: dir?.path,
  );
  if (data != null) {
    logger.info('Saving pacient picture $patientId');
    await file.create(recursive: true);
    await file.writeAsBytes(data);
  } else {
    logger.info('No pacient picture found $patientId');
    var exists = file.existsSync();
    if (exists) {
      await file.delete();
    }
  }
}
