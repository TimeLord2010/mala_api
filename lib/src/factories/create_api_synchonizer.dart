import 'package:get_it/get_it.dart';
import 'package:mala_api/src/repositories/api_syncer_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../repositories/patient_repository/hybrid_patient_repository.dart';
import '../usecases/object/error/get_error_message.dart';
import 'create_patient_repository.dart';
import 'http_client.dart';

Future<ApiSynchronizerRepository?> createApiSynchonizer() async {
  var prefs = GetIt.I.get<SharedPreferences>();
  var rep = await createPatientRepository();
  if (rep is! HybridPatientRepository) {
    return null;
  }
  return ApiSynchronizerRepository(
    hybridPatientRepository: rep,
    preferences: prefs,
    errorReporter: (context, err) async {
      await dio.post(
        '/log',
        data: {
          'context': 'context',
          'level': 'error',
          'message': getErrorMessage(err) ?? '<no message found>',
        },
      );
    },
  );
}
