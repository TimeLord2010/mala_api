import 'package:mala_api/src/data/enums/activities.dart';

class PatientQuery {
  String? name;
  String? district;
  String? street;
  int? minAge;
  int? maxAge;
  bool monthBirthday;
  Set<Activities>? activies;

  PatientQuery({
    this.name,
    this.district,
    this.street,
    this.minAge,
    this.maxAge,
    this.activies,
    this.monthBirthday = false,
  });

  bool get hasName => name?.isNotEmpty ?? false;
  bool get hasDistrict => district?.isNotEmpty ?? false;
  bool get hasStreet => street?.isNotEmpty ?? false;
  bool get hasActivities => activies?.isNotEmpty ?? false;

  bool get hasAddress => hasDistrict || hasStreet;
  bool get isEmptyQuery {
    if (minAge != null || maxAge != null) return false;
    return !hasAddress && !monthBirthday && !hasActivities;
  }
}
