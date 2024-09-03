import 'package:mala_api/src/usecases/entities/index.dart';

class UserModule {
  Future<void> login(String email, String password) async {
    await loginUser(email, password);
  }

  Future<void> logout() async {
    await signout();
  }

  bool get isLogged => isAuthenticated();
}
