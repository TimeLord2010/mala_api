import '../../data/enums/local_keys.dart';
import '../../data/errors/missing_local_jwt.dart';
import '../../factories/local_store_repository.dart';

String getLocalJwt() {
  var rep = createLocalStoreRepository();
  var jwt = rep.getString(LocalKeys.jwt);
  if (jwt == null) throw MissingLocalJwt();
  return jwt;
}
