import '../../../../../data/enums/local_keys.dart';
import '../set_tag_value.dart';

/// Sets the tag height used in pdf generation in the local store.
Future<void> setTagHeight(double? value) async {
  await setTagValue(
    minimum: 10,
    maximum: 140,
    key: LocalKeys.pdfTagHeight,
    logKey: 'setTagHeight',
    value: value,
  );
}
