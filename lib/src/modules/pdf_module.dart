import 'dart:io';

import 'package:mala_api/src/data/models/patient_tag.dart';
import 'package:mala_api/src/usecases/file/index.dart';
import 'package:printing/printing.dart';

import '../data/entities/patient.dart';

class PdfModule {
  Future<void> printInfo({
    required Iterable<Patient> patients,
    String filename = 'Pacientes.pdf',
  }) async {
    var bytes = await createPatientsPdf(patients: patients);
    print('Bytes of patients pdf: ${bytes.lengthInBytes ~/ 1024}KB');
    if (Platform.isMacOS) {
      // The document is already laid out for A4, so there is nothing to
      // relayout. Keeping the dynamic layout on makes the print panel ask for
      // the bytes again on every paper size change, copying the whole document
      // to the native side each time.
      await Printing.layoutPdf(
        onLayout: (format) => bytes,
        name: filename,
        dynamicLayout: false,
      );
      return;
    }
    await Printing.sharePdf(bytes: bytes, filename: filename);
  }

  Future<void> printTags({required Iterable<PatientTag> tags}) async {
    var bytes = await createTagsPdf(tags: tags);
    if (Platform.isMacOS) {
      await Printing.layoutPdf(
        onLayout: (format) {
          return bytes;
        },
        dynamicLayout: false,
      );
    } else {
      await Printing.sharePdf(bytes: bytes, filename: 'etiquetas.pdf');
    }
  }
}
