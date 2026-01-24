import 'dart:async';

import '../../../factories/logger.dart';
import '../logs/insert_remote_log.dart';
import 'update_jwt.dart';

Future<void> signout() async {
  var logger = createSdkLogger('signout');

  logger.d('Signing out');
  // if (kDebugMode) {
  //   //await deleteUserFiles();
  // } else {
  // }
  logger.d('Insering remote log "signed out"');
  unawaited(insertRemoteLog(message: 'Signing out', context: 'Sign out'));
  logger.d('Removing jwt');
  await updateJwt(null);
}
