import 'package:mala_api/src/usecases/local_store/index.dart' as local;

class TagPdfConfiguration {
  // MARK: Dimensions

  double get tagWidth => local.getTagWidth();
  Future<void> setTagWidth(double? value) async {
    await local.setTagWidth(value);
  }

  double get tagHeight => local.getTagHeight();
  Future<void> setTagHeight(double? value) async {
    await local.setTagHeight(value);
  }

  // MARK: Margin

  double get tagLeftMargin => local.getTagLeftMargin();
  Future<void> setTagLeftMargin(double? value) async {
    await local.setTagLeftMargin(value);
  }

  double get tagRightMargin => local.getTagRightMargin();
  Future<void> setTagRightMargin(double? value) async {
    await local.setTagRightMargin(value);
  }

  double get tagTopMargin => local.getTagTopMargin();
  Future<void> setTagTopMargin(double? value) async {
    await local.setTagTopMargin(value);
  }

  double get tagBottomMargin => local.getTagBottomMargin();
  Future<void> setTagBottomMargin(double? value) async {
    await local.setTagBottomMargin(value);
  }

  // MARK: Spacings

  double get tagHorizontalSpacing => local.getTagHorizontalSpacing();
  Future<void> setTagHorizontalSpacing(double? value) async {
    await local.setTagHorizontalSpacing(value);
  }

  double get tagVerticalSpacing => local.getTagVerticalSpacing();
  Future<void> setTagVerticalSpacing(double? value) async {
    await local.setTagVerticalSpacing(value);
  }
}
