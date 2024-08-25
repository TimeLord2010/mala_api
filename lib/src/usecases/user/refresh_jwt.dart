import '../../data/errors/failed_to_refresh_jwt.dart';
import '../../factories/logger.dart';
import '../../repositories/user_api_repository.dart';
import '../local_store/get_local_jwt.dart';
import 'update_jwt.dart';

///
/// @throws [FailedToRefreshJwt] if not jwt token is set in the http client.
Future<void> refreshJwt() async {
  getLocalJwt();
  var rep = UserRepository();
  int i = 0;
  while (true) {
    try {
      var newJwt = await rep.generateNewJwt();
      await updateJwt(newJwt);
      return;
    } catch (e) {
      logger.error('ERROR while refreshing JWT: ${e.toString()}');
      if (i++ < 3) {
        await Future.delayed(const Duration(seconds: 1));
      } else {
        throw FailedToRefreshJwt(e);
      }
    }
  }
}
