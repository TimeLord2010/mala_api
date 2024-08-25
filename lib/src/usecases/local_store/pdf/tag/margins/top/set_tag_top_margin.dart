import '../../../../../../data/enums/local_keys.dart';
import '../../set_tag_value.dart';

Future<void> setTagTopMargin(double? value) async {
  await setTagValue(
    key: LocalKeys.pdfTagTopMargin,
    logKey: 'setTagTopMargin',
    minimum: 0,
    maximum: 100,
    value: value,
  );
}
