import 'dart:io';

import 'package:mala_api/src/data/models/patient_tag.dart';
import 'package:mala_api/src/usecases/file/index.dart';
import 'package:printing/printing.dart';

import '../data/entities/patient.dart';

class PdfModule {
  Future<void> printInfo({
    required List<Patient> patients,
  }) async {
    var bytes = await createPatientsPdf(patients: patients);
    if (Platform.isMacOS) {
      await Printing.layoutPdf(
        onLayout: (format) => bytes,
      );
      return;
    }
    await Printing.sharePdf(
      bytes: bytes,
      filename: 'Pacientes.pdf',
    );
  }

  Future<void> printTags({
    required Iterable<PatientTag> tags,
  }) async {
    var bytes = await createTagsPdf(tags: tags);
    if (Platform.isMacOS) {
      await Printing.layoutPdf(
        onLayout: (format) {
          return bytes;
        },
        dynamicLayout: false,
      );
    } else {
      await Printing.sharePdf(
        bytes: bytes,
        filename: 'etiquetas.pdf',
      );
    }
  }
}
