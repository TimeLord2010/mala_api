import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../repositories/local_store_repository.dart';

LocalStoreRepository createLocalStoreRepository() {
  var prefs = GetIt.I.get<SharedPreferences>();
  return LocalStoreRepository(prefs);
}
