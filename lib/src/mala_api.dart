import 'package:mala_api/src/modules/file_module.dart';
import 'package:mala_api/src/modules/patient_module.dart';
import 'package:mala_api/src/modules/pdf_module.dart';
import 'package:mala_api/src/modules/server_module.dart';
import 'package:mala_api/src/modules/tag_pdf_configuration.dart';
import 'package:mala_api/src/modules/user_module.dart';

class MalaApi {
  static final file = FileModule();
  static final patient = PatientModule();
  static final pdf = PdfModule();
  static final server = ServerModule();
  static final tagPdfConfig = TagPdfConfiguration();
  static final user = UserModule();
}
