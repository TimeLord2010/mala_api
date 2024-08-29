import 'dart:async';

import '../../../factories/logger.dart';
import '../logs/insert_remote_log.dart';
import 'update_jwt.dart';

Future<void> signout() async {
  logger.debug('Signing out');
  // if (kDebugMode) {
  //   //await deleteUserFiles();
  // } else {
  // }
  logger.debug('Insering remote log "signed out"');
  unawaited(insertRemoteLog(
    message: 'Signing out',
    context: 'Sign out',
  ));
  logger.debug('Removing jwt');
  await updateJwt(null);
}
