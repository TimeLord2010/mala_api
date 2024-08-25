import '../../../../../../data/enums/local_keys.dart';
import '../../set_tag_value.dart';

Future<void> setTagRightMargin(double? value) async {
  await setTagValue(
    minimum: 0,
    maximum: 0,
    key: LocalKeys.pdfTagRightMargin,
    logKey: 'setTagRightMargin',
    value: value,
  );
}
