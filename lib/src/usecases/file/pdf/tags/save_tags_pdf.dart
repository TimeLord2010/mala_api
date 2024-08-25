import 'dart:io';

import '../../../../data/models/patient_tag.dart';
import '../../../date/get_current_date_numbers.dart';
import 'create_tags_pdf.dart';

/// Creates a pdf of patients tags in memory in byte format and writes the data
/// into a file inside the provided directory.
///
/// The file created has the name "etiquetas <number>.pdf"
Future<File?> saveTagsPdf({
  required Iterable<PatientTag> tags,
  required Directory saveDirectory,
}) async {
  var path = saveDirectory.path;
  var filename = '$path/entiquetas ${getCurrentDateNumbers()}.pdf';
  var bytes = await createTagsPdf(tags: tags);
  final file = File(filename);
  await file.writeAsBytes(bytes);
  return file;
}
