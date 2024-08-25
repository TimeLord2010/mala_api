import '../../../../../data/enums/local_keys.dart';
import '../set_tag_value.dart';

Future<void> setTagHorizontalSpacing(double? value) async {
  await setTagValue(
    minimum: 0,
    maximum: 100,
    key: LocalKeys.pdfTagHorizontalSpacing,
    logKey: 'setTagHorizontalSpacing',
    value: value,
  );
}
