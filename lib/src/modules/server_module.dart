import 'dart:async';

import 'package:mala_api/src/usecases/entities/patient/send_pending_patients.dart';
import 'package:mala_api/src/usecases/local_store/jwt/has_jwt.dart';

import '../factories/index.dart';
import '../usecases/entities/index.dart';
import '../usecases/entities/patient/fetch_changed_patients.dart';
import '../usecases/object/index.dart';

/// Contains functions involving the server communication directly.
class ServerModule {
  /// Syncs the changes between server and local storage.
  ///
  /// - Fetches the new and changes patients from the server.
  /// - Sends new and changed patients to the server.
  /// - Retries failed operations;
  ///
  /// [uiNotifier] will be called with a message meant to the seem by the user
  /// to inform him about the status of the operation.
  ///
  /// [shouldAbort] will be used to check if the operation should be canceled.
  /// Which can happen when the user logs out for example.
  Future<void> sync({
    required void Function(String message) uiNotifier,
    required bool Function() shouldAbort,
    required void Function(String context, String message) errorNotifier,
  }) async {
    try {
      var isAuthed = hasJWT();
      if (!isAuthed) {
        return;
      }
      // Refresh JWT
      uiNotifier('Atualizando token de autenticação');
      await refreshJwt();

      // Fetch patient changes from server
      uiNotifier('Atualizando pacientes a partir do servidor');
      await fetchChangedPatients(
        didCancel: () => shouldAbort(),
        updater: (lastSync) {
          uiNotifier('Obtendo pacientes do servidor desde $lastSync');
        },
      );
      if (shouldAbort()) return;

      // Sending new patients to server
      uiNotifier('Enviando mudanças feitas enquanto offline');
      await sendPendingPatients();
      if (shouldAbort()) return;

      // Retring failed updates to server
      uiNotifier('Enviando operações pendentes');
      await sendFailedBackgroundOperations();
    } catch (e, stack) {
      var msg = getErrorMessage(e);
      logger.error('Failed to sync data: $msg');
      if (isNoInternetError(e)) {
        logger.warn('No internet detected! Ended error handling');
        return;
      }
      var dialogMsg = msg ?? 'Erro desconhecido';
      unawaited(insertRemoteLog(
        context: 'Syncronizing data',
        message: dialogMsg,
        stack: stack.toString(),
        level: 'error',
      ));
      if (shouldAbort()) return;
      errorNotifier('sincronização de registros', dialogMsg);
    }
  }
}
