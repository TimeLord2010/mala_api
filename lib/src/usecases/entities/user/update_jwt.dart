import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../data/enums/local_keys.dart';
import '../../../factories/logger.dart';
import '../../http/set_jwt_header.dart';

Future<void> updateJwt(String? jwt) async {
  setJwtHeader(jwt);
  var prefs = GetIt.I.get<SharedPreferences>();
  if (jwt != null) {
    logger.debug('Removing jwt from local storage');
    await prefs.setString(LocalKeys.jwt.name, jwt);
  } else {
    await prefs.remove(LocalKeys.jwt.name);
  }
}
