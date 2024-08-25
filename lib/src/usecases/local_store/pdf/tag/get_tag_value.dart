import '../../../../data/enums/local_keys.dart';
import '../../../../factories/local_store_repository.dart';

double getTagValue(LocalKeys key, double defaultValue) {
  var rep = createLocalStoreRepository();
  var value = rep.getDouble(key);

  return value ?? defaultValue;
}
