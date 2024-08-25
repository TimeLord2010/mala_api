import '../../../../../../data/enums/local_keys.dart';
import '../../set_tag_value.dart';

Future<void> setTagLeftMargin(double? value) async {
  await setTagValue(
    minimum: 0,
    maximum: 100,
    value: value,
    key: LocalKeys.pdfTagLeftMargin,
    logKey: 'setTagLeftMargin',
  );
}
