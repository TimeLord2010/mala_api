import 'package:mala_api/src/usecases/local_store/index.dart';

class TagPdfConfiguration {
  // MARK: Dimensions

  double get tagWidth => getTagWidth();
  set tagWidth(double value) {
    setTagWidth(value);
  }

  double get tagHeight => getTagHeight();
  set tagHeight(double value) {
    setTagHeight(value);
  }

  // MARK: Margin

  double get tagLeftMargin => getTagLeftMargin();
  set tagLeftMargin(double value) {
    setTagLeftMargin(value);
  }

  double get tagRightMargin => getTagRightMargin();
  set tagRightMargin(double value) {
    setTagRightMargin(value);
  }

  double get tagTopMargin => getTagTopMargin();
  set tagTopMargin(double value) {
    setTagTopMargin(value);
  }

  double get tagBottomMargin => getTagBottomMargin();
  set tagBottomMargin(double value) {
    setTagBottomMargin(value);
  }

  // MARK: Spacings

  double get tagHorizontalSpacing => getTagHorizontalSpacing();
  set tagHorizontalSpacing(double value) {
    setTagHorizontalSpacing(value);
  }

  double get tagVerticalSpacing => getTagVerticalSpacing();
  set tagVerticalSpacing(double value) {
    setTagVerticalSpacing(value);
  }
}
