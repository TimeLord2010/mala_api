import '../../../../../../data/enums/local_keys.dart';
import '../../set_tag_value.dart';

Future<void> setTagBottomMargin(double? value) async {
  await setTagValue(
    key: LocalKeys.pdfTagBottomMargin,
    logKey: 'setTagBottomMargin',
    minimum: 0,
    maximum: 100,
    value: value,
  );
}
