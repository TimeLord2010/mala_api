import 'package:mala_api/src/data/entities/user.dart';
import 'package:mala_api/src/data/responses/login_response.dart';
import 'package:mala_api/src/factories/http_client.dart';

class UserRepository {
  Future<LoginResponse> login(String email, String password) async {
    var response = await dio.get(
      '/user',
      queryParameters: {
        'email': email,
        'password': password,
      },
    );
    var user = User.fromMap(response.data);
    var jwt = response.headers.value('jwt');
    if (jwt == null) throw Exception('JWT not found at response headers');
    return LoginResponse(
      user: user,
      jwt: jwt,
    );
  }

  Future<String> generateNewJwt() async {
    var response = await dio.get('/user/self');
    String? jwt = response.headers.value('jwt');
    if (jwt == null) throw Exception('JWT not found at response headers');
    return jwt;
  }

  Future<void> updateLastSync(DateTime date) async {
    var iso = date.toUtc().toIso8601String();
    await dio.post(
      '/user',
      data: {
        'lastSyncDate': iso,
      },
    );
  }
}
