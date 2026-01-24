import 'package:mala_api/src/data/enums/activities.dart';
import 'package:mala_api/src/data/models/patient_query.dart';

class SQLQueryBuilder {
  final List<String> _whereClauses = [];
  final List<Object?> _arguments = [];

  void addNameFilter(String? name) {
    if (name == null || name.isEmpty) return;
    _whereClauses.add('p.name LIKE ?');
    _arguments.add('%$name%');
  }

  void addAgeFilter(int? minAge, int? maxAge) {
    final now = DateTime.now();

    if (minAge != null) {
      _whereClauses.add('p.year_of_birth IS NOT NULL');
      _whereClauses.add('p.year_of_birth < ?');
      _arguments.add(now.year - minAge);
    }

    if (maxAge != null) {
      if (_whereClauses.isEmpty || !_whereClauses.contains('p.year_of_birth IS NOT NULL')) {
        _whereClauses.add('p.year_of_birth IS NOT NULL');
      }
      _whereClauses.add('p.year_of_birth > ?');
      _arguments.add(now.year - maxAge);
    }
  }

  void addMonthBirthdayFilter(bool monthBirthday) {
    if (!monthBirthday) return;
    final now = DateTime.now();
    _whereClauses.add('p.month_of_birth IS NOT NULL');
    _whereClauses.add('p.month_of_birth = ?');
    _arguments.add(now.month);
  }

  void addActivitiesFilter(Set<Activities>? activities) {
    if (activities == null || activities.isEmpty) return;

    final placeholders = activities.map((_) => '?').join(',');
    _whereClauses.add('''
      EXISTS (
        SELECT 1 FROM patient_activities pa
        WHERE pa.patient_id = p.id
        AND pa.activity_id IN ($placeholders)
      )
    ''');

    _arguments.addAll(activities.map((a) => a.index));
  }

  void addAddressFilter(String? district, String? street) {
    if (district != null && district.isNotEmpty) {
      _whereClauses.add('a.district LIKE ? COLLATE NOCASE');
      _arguments.add('%$district%');
    }

    if (street != null && street.isNotEmpty) {
      _whereClauses.add('a.street LIKE ? COLLATE NOCASE');
      _arguments.add('%$street%');
    }
  }

  String buildWhereClause() {
    if (_whereClauses.isEmpty) return '';
    return 'WHERE ${_whereClauses.join(' AND ')}';
  }

  List<Object?> get arguments => _arguments;

  static SQLQueryBuilder fromPatientQuery(PatientQuery query) {
    final builder = SQLQueryBuilder();
    builder.addNameFilter(query.name);
    builder.addAgeFilter(query.minAge, query.maxAge);
    builder.addMonthBirthdayFilter(query.monthBirthday);
    builder.addActivitiesFilter(query.activies);
    builder.addAddressFilter(query.district, query.street);
    return builder;
  }
}
