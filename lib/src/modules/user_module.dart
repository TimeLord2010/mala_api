import 'package:mala_api/src/usecases/entities/index.dart';

class UserModule {
  Future<void> login(String email, String password) async {
    await loginUser(email, password);
  }

  Future<void> logout() async {
    await signout();
  }

  /// Checks for a valid JWT in the local storage.
  ///
  /// As a side effect, this will also refresh the JWT in the http client with
  /// the value on the local storage.
  bool get isLogged => isAuthenticated();
}
