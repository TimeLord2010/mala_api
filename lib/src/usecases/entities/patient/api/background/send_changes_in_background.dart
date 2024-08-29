import 'package:vit_logger/vit_logger.dart';

import '../../../../../data/entities/patient.dart';
import '../../../../../factories/create_api_synchonizer.dart';

/// Sends api call to send update or insert of new patient.
///
/// This method should NOT return a future, to prevent delays in the
/// UI.
Future<void> sendChangesInBackground(
  Patient patient, {
  bool throwOnError = false,
}) async {
  var rep = await createApiSynchonizer();
  if (rep == null) {
    return;
  }
  var stopWatch = VitStopWatch('Sending patient to server in background');
  try {
    await rep.upsertPatient(
      patient,
      throwOnError: throwOnError,
    );
  } catch (e) {
    stopWatch.lap(tag: 'Error');
    rethrow;
  } finally {
    stopWatch.stop();
  }
}
