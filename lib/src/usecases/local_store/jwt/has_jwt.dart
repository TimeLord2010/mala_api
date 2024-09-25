import '../../../data/enums/local_keys.dart';
import '../../../factories/local_store_repository.dart';

bool hasJWT() {
  var rep = createLocalStoreRepository();
  var has = rep.has(LocalKeys.jwt);
  return has;
}
