import 'dart:convert';
import 'dart:io';

import 'package:archive/archive_io.dart';

import '../../../data/models/patient_query.dart';
import '../../../factories/logger.dart';
import '../../file/get_export_patients_file_name.dart';
import '../../object/date/get_current_date_numbers.dart';
import 'count_patients.dart';
import 'list_patients.dart';
import 'profile_picture/load_profile_picture.dart';
import 'profile_picture/save_or_remove_profile_picture.dart';

Future<void> exportPatients({
  required PatientQuery query,
  required String outputDir,
  required void Function({
    required String event,
    required double progress,
    String? message,
  }) onProgress,
  int step = 200,
}) async {
  var sep = Platform.pathSeparator;
  var values = getCurrentDateNumbers();
  var dir = Directory('$outputDir${sep}Mala backup [$values]');
  var filename = dir.path + sep + getExportPatientsFileName();
  var file = File(filename);
  await file.create(recursive: true);
  var total = await countPatients(query);
  var stream = file.openWrite();
  stream.write('[');
  int processed = 0;
  for (int page = 0; processed < total; page++) {
    var toBeProcessed = total - (page * step);
    var hasNextPage = toBeProcessed > step;
    var items = await listPatients(
      patientQuery: query,
      limit: step,
      skip: page * step,
    );
    logger.info('Exporting ${items.length} patients');
    var maps = items.map((x) => jsonEncode(x.toMap)).join(',');
    if (hasNextPage) {
      stream.write('$maps,');
    } else {
      stream.write(maps);
    }
    for (var patient in items) {
      var pictureData = await loadProfilePicture(patient.id);
      if (pictureData == null) continue;
      await saveOrRemoveProfilePicture(
        patientId: patient.id,
        data: pictureData,
        dir: dir,
      );
    }
    processed += items.length;
    var progress = processed / total;
    onProgress(
      event: 'Escrevendo dados',
      progress: progress,
      message: '$processed registros processados',
    );
    await Future.delayed(const Duration(milliseconds: 10));
  }
  logger.info('Exported $processed patients');
  stream.write(']');
  await stream.flush();
  await stream.close();
  var encoder = ZipFileEncoder();
  encoder.create('$outputDir${sep}Mala backup.zip');
  await encoder.addDirectory(
    dir,
    onProgress: (progress) {
      onProgress(
        event: 'Compactando',
        progress: progress,
      );
    },
  );
  await encoder.close();
  await dir.delete(
    recursive: true,
  );
}
