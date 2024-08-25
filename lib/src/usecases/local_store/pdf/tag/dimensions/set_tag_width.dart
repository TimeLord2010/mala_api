import '../../../../../data/enums/local_keys.dart';
import '../set_tag_value.dart';

Future<void> setTagWidth(double? value) async {
  await setTagValue(
    minimum: 20,
    maximum: 600,
    key: LocalKeys.pdfTagWidth,
    logKey: 'setTagWidth',
    value: value,
  );
}
