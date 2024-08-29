import 'dart:io';
import 'dart:typed_data';

import 'package:mala_api/src/usecases/entities/patient/profile_picture/get_picture_file.dart';

import '../../../../factories/logger.dart';

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
