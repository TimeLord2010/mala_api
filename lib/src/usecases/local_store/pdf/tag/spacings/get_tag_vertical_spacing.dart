import 'package:mala_api/src/data/enums/local_keys.dart';
import 'package:mala_api/src/usecases/local_store/pdf/tag/get_tag_value.dart';

double getTagVerticalSpacing() {
  return getTagValue(LocalKeys.pdfTagVerticalSpacing, 0);
}
