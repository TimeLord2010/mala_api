import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../http/set_jwt_header.dart';

bool isAuthenticated() {
  var prefs = GetIt.I.get<SharedPreferences>();
  String? jwt = prefs.getString('jwt');
  setJwtHeader(jwt);
  return jwt != null;
}
