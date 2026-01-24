import 'package:mala_api/src/data/entities/address.dart';
import 'package:vit_dart_extensions/vit_dart_extensions.dart';

class Patient {
  int id = 0;

  String? remoteId;

  bool? hasPicture;

  DateTime? uploadedAt;

  String? name;
  List<String>? phones;
  String? motherName;

  String? cpf;
  String? observation;

  /// Exists to improve performance for filtering users that
  /// have a certain age.
  int? yearOfBirth;

  /// Exists to improve query performance for month birthdays.
  int? monthOfBirth;

  /// Exists to improve query performance for birthdays.
  int? dayOfBirth;

  List<int>? activitiesId;

  DateTime? createdAt;

  DateTime? updatedAt;

  Address? address;

  Patient({
    this.remoteId,
    this.uploadedAt,
    this.name,
    this.cpf,
    this.motherName,
    this.observation,
    this.phones,
    this.activitiesId,
    this.dayOfBirth,
    this.monthOfBirth,
    this.yearOfBirth,
    this.createdAt,
    this.updatedAt,
    this.hasPicture,
  });

  factory Patient.fromMap(Map<String, dynamic> map) {
    List? phones = map['phones'];
    List? activities = map['activitiesId'];
    bool hasPicture = map['hasPicture'] ?? false;
    var p = Patient(
      name: map['name'],
      phones: phones?.map((x) => x as String).toList(),
      motherName: map['motherName'],
      cpf: map['cpf'],
      observation: map['observation'],
      yearOfBirth: map['yearOfBirth'],
      monthOfBirth: map['monthOfBirth'],
      dayOfBirth: map['dayOfBirth'],
      activitiesId: activities?.map((x) {
        if (x is int) {
          return x;
        }
        if (x is String) {
          return int.parse(x);
        }
        throw Exception('Invalid activity index: $x');
      }).toList(),
      createdAt: map.tryGetDateTime('createdAt'),
      updatedAt: map.tryGetDateTime('updatedAt'),
      uploadedAt: map.tryGetDateTime('uploadedAt'),
      remoteId: map['remoteId'],
      hasPicture: hasPicture,
    );
    var address = map['address'];
    if (address != null) {
      p.address = Address.fromMap(address);
    }
    dynamic id = map['id'];
    if (id is int) {
      p.id = id;
    } else if (id is String) {
      p.remoteId = id;
    }
    return p;
  }

  DateTime? get birthDate {
    if (yearOfBirth == null || monthOfBirth == null || dayOfBirth == null) {
      return null;
    }
    return DateTime(yearOfBirth!, monthOfBirth!, dayOfBirth!);
  }

  int? get years {
    if (birthDate == null) return null;
    var dif = DateTime.now().difference(birthDate!);
    return (dif.inDays / 365).floor();
  }

  bool get hasBirthDayThisMonth {
    var birth = birthDate;
    if (birth == null) return false;
    var nowMonth = DateTime.now().month;
    return nowMonth == birth.month;
  }

  bool get isBirthdayToday {
    var birth = birthDate;
    if (birth == null) return false;
    var now = DateTime.now();
    return now.month == birth.month && now.day == birth.day;
  }

  Map<String, dynamic> get toMap {
    return {
      'id': id,
      if (remoteId != null) ...{'remoteId': remoteId},
      if (uploadedAt != null) ...{'uploadedAt': uploadedAt!.toIso8601String()},
      if (name != null) ...{'name': name},
      'hasPicture': hasPicture,
      if (phones?.isNotEmpty ?? false) ...{'phones': phones},
      if (motherName != null) ...{'motherName': motherName},
      if (cpf?.isNotEmpty ?? false) ...{'cpf': cpf},
      if (observation?.isNotEmpty ?? false) ...{'observation': observation},
      if (yearOfBirth != null) ...{'yearOfBirth': yearOfBirth},
      if (monthOfBirth != null) ...{'monthOfBirth': monthOfBirth},
      if (dayOfBirth != null) ...{'dayOfBirth': dayOfBirth},
      if (activitiesId?.isNotEmpty ?? false) ...{'activitiesId': activitiesId},
      if (address != null) ...{'address': address!.toMap},
      if (createdAt != null) ...{'createdAt': createdAt!.toIso8601String()},
      if (updatedAt != null) ...{'updatedAt': updatedAt!.toIso8601String()},
    };
  }

  Map<String, dynamic> get toApiMap {
    var map = toMap;
    map.remove('id');
    var remoteId = map['remoteId'];
    if (remoteId != null) {
      map['id'] = remoteId;
    }
    return map;
  }

  bool get isEmpty {
    if (id != 0) return false;
    if (name != null || cpf != null || motherName != null) return false;
    if (dayOfBirth != null || monthOfBirth != null || yearOfBirth != null) {
      return false;
    }
    if (remoteId != null || uploadedAt != null) return false;
    if (observation != null) return false;
    if (createdAt != null) return false;
    return true;
  }

  @override
  int get hashCode => id.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) || other is Patient && id == other.id;
}
