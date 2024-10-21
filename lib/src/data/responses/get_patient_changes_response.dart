import 'package:vit_dart_extensions/vit_dart_extensions.dart';

import '../entities/patient.dart';

class GetPatientChangesResponse {
  List<Patient> changed;
  List<DeletedUsersRecord> deleted;
  ChangeDates? dates;

  GetPatientChangesResponse({
    required this.changed,
    required this.deleted,
    this.dates,
  });

  factory GetPatientChangesResponse.fromMap(Map<String, dynamic> map) {
    List changed = map['changed'];
    List deleted = map['deleted'];
    Map<String, dynamic>? dates = map['dates'];
    return GetPatientChangesResponse(
      changed: changed.map((x) => Patient.fromMap(x)).toList(),
      deleted: deleted.map((x) => DeletedUsersRecord.fromMap(x)).toList(),
      dates: dates == null ? null : ChangeDates.fromMap(dates),
    );
  }

  get length => changed.length + deleted.length;

  get isEmpty => length == 0;
}

class DeletedUsersRecord {
  List<String> patientIds;
  String userId;
  DateTime disabledAt;

  DeletedUsersRecord({
    required this.patientIds,
    required this.userId,
    required this.disabledAt,
  });

  factory DeletedUsersRecord.fromMap(Map<String, dynamic> map) {
    List ids = map['patientIds'];
    return DeletedUsersRecord(
      patientIds: ids.map((x) => x as String).toList(),
      userId: map['userId'],
      disabledAt: map.getDateTime('disabledAt'),
    );
  }
}

class ChangeDates {
  DateTime? initialDate, finalDate;

  ChangeDates({
    required this.initialDate,
    required this.finalDate,
  });

  factory ChangeDates.fromMap(Map<String, dynamic> map) {
    return ChangeDates(
      initialDate: map.tryGetDateTime('initial'),
      finalDate: map.tryGetDateTime('final'),
    );
  }
}
