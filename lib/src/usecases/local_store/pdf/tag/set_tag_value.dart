import '../../../../data/enums/local_keys.dart';
import '../../../../factories/local_store_repository.dart';
import '../../../../factories/logger.dart';

/// Generic tag value setter.
Future<void> setTagValue({
  required double minimum,
  required double maximum,
  required LocalKeys key,
  required String logKey,
  required double? value,
}) async {
  var logger = createSdkLogger('setTagValue');
  var rep = createLocalStoreRepository();

  if (value == null) {
    logger.i('($logKey) Removing value...');
    await rep.remove(LocalKeys.pdfTagWidth);
    return;
  }

  if (value < minimum) {
    logger.w('($logKey) Aborted: value $value was too small');
    return;
  }

  if (value > maximum) {
    logger.w('($logKey) Aborted: value $value was too high');
    return;
  }

  logger.i('($logKey) $value');
  await rep.setDouble(key, value);
}
