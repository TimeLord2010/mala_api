import 'package:mala_api/src/modules/file_module.dart';
import 'package:mala_api/src/modules/patient_module.dart';
import 'package:mala_api/src/modules/pdf_module.dart';
import 'package:mala_api/src/modules/server_module.dart';
import 'package:mala_api/src/modules/tag_pdf_configuration.dart';

class MalaApi {
  static final patient = PatientModule();
  static final server = ServerModule();
  static final pdf = PdfModule();
  static final tagPdfConfig = TagPdfConfiguration();
  static final file = FileModule();
}
