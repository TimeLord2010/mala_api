import 'dart:io';

import '../../../../data/entities/patient.dart';
import 'create_patients_pdf.dart';

/// Creates a pdf of the patients in byte format in memory and saves the data
/// into a file called "Lista de pacientes.pdf" in the given directory.
///
/// Note to self: this method used to pick the directory too from a user input.
Future<void> savePatientsPdf({
  required List<Patient> patients,
  required Directory saveDirectory,
}) async {
  var dir = saveDirectory.path;
  var filename = '$dir/Lista de pacientes.pdf';
  var file = File(filename);
  var bytes = await createPatientsPdf(patients: patients);
  await file.writeAsBytes(bytes);
}
