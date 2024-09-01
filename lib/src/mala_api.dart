import 'package:mala_api/src/modules/file_module.dart';
import 'package:mala_api/src/modules/patient_module.dart';
import 'package:mala_api/src/modules/pdf_module.dart';
import 'package:mala_api/src/modules/server_module.dart';
import 'package:mala_api/src/modules/tag_pdf_configuration.dart';

class MalaApi {
  final patient = PatientModule();
  final server = ServerModule();
  final pdf = PdfModule();
  final tagPdfConfig = TagPdfConfiguration();
  final file = FileModule();
}
