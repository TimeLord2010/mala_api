import 'dart:async';

import '../../../data/entities/user.dart';
import '../../../repositories/user_api_repository.dart';
import '../logs/insert_remote_log.dart';
import 'update_jwt.dart';

/// Checks for credentials in the server.
///
/// If they match, the generated JWT is persisted in the local storage and
/// the http client.
Future<User> loginUser(String email, String password) async {
  var userRep = UserRepository();
  var response = await userRep.login(email, password);
  unawaited(insertRemoteLog(
    message: 'User logged in',
    context: 'login',
    extras: {'email': email},
  ));
  unawaited(updateJwt(response.jwt));
  return response.user;
}
