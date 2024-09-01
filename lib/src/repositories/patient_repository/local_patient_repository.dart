import 'dart:io';
import 'dart:typed_data';

import 'package:archive/archive_io.dart';
import 'package:isar/isar.dart';
import 'package:mala_api/src/data/entities/address.dart';
import 'package:mala_api/src/data/entities/patient.dart';
import 'package:mala_api/src/data/interfaces/patient_interface.dart';
import 'package:mala_api/src/data/models/patient_query.dart';
import 'package:mala_api/src/factories/logger.dart';
import 'package:path_provider/path_provider.dart';
import 'package:vit_dart_extensions/vit_dart_extensions.dart';
import 'package:vit_logger/vit_logger.dart';

import '../../usecases/entities/patient/imports/load_patients_from_json.dart';
import '../../usecases/entities/patient/profile_picture/get_picture_file.dart';
import '../../usecases/entities/patient/upsert_patient.dart';
import '../../usecases/file/get_export_patients_file_name.dart';

class LocalPatientRepository extends PatientInterface<int> {
  final Isar isar;

  LocalPatientRepository(this.isar);

  @override
  Future<int> count([PatientQuery? query]) async {
    if (query == null) {
      return isar.patients.count();
    }
    var count = await _buildQuery(query).count();
    return count;
  }

  @override
  Future<void> delete(Patient patient) async {
    var id = getId(patient);
    await deleteById(id);
  }

  @override
  Future<List<Patient>> list(
    PatientQuery query, {
    int? skip,
    int? limit,
  }) async {
    var docs =
        await _buildQuery(query).offset(skip ?? 0).limit(limit ?? 60).findAll();
    return docs;
  }

  @override
  Future<Patient> upsert(Patient patient) async {
    // var oldId = patient.id;
    await isar.writeTxn(() async {
      var hadId = patient.id > 0;
      var id = await isar.patients.put(patient);
      if (!hadId) logger.info('New id: $id');
    });
    // var inserted = oldId != patient.id;
    // if (inserted) {
    //   logger.info('INSERTED PATIENT!!!');
    // } else {
    //   logger.info('UPDATED PATIENT!!!');
    // }
    var address = patient.address.value;
    if (address != null) {
      await isar.writeTxn(() async {
        await isar.address.put(address);
        await patient.address.save();
      });
    }
    return patient;
  }

  /// Fetches the patients who do not have the "remoteId" field set.
  Future<List<Patient>> findLocalPatients({
    required int skip,
    required int limit,
  }) {
    var stopWatch = VitStopWatch('findLocalPatients');
    var query = isar.patients.where();
    var patients = query.remoteIdIsNull().offset(skip).limit(limit).findAll();
    stopWatch.stop();
    return patients;
  }

  @override
  Future<Patient?> getById(int id) async {
    var intId = getId(id);
    var patient = await isar.patients.get(intId);
    return patient;
  }

  @override
  Future<Iterable<Patient>> listByCreation(Iterable<DateTime> createdAts) {
    var where = isar.patients.where();
    var query = where.createdAtIsNotNull();
    for (var dt in createdAts) {
      query = query.or().createdAtEqualTo(dt);
    }
    return query.findAll();
  }

  Future<List<Patient>> findByIds(List<int> ids) {
    var where = isar.patients.where();
    var first = ids.removeAt(0);
    var afterWhere = where.idEqualTo(first);
    while (ids.isNotEmpty) {
      afterWhere = afterWhere.or().idEqualTo(ids.removeAt(0));
    }
    return afterWhere.findAll();
  }

  Future<int?> findIdByRemoteId(String remoteId) async {
    var where = isar.patients.where();
    var id = await where.remoteIdEqualTo(remoteId).idProperty().findFirst();
    return id;
  }

  int getId(data) {
    if (data is Patient) {
      return data.id;
    }
    if (data is int) {
      return data;
    }
    if (data is String) {
      return int.parse(data);
    }
    throw Exception('Falha ao obter id de paciente de: $data');
  }

  @override
  Future<void> deleteById(int id) async {
    await isar.writeTxn(() async {
      await isar.patients.delete(id);
    });
  }

  Future<List<Patient>> importPatients({
    required String zipFileName,
    void Function(double progress)? onProgress,
  }) async {
    var dir = await getApplicationDocumentsDirectory();
    logger.info('zipFile: $zipFileName');
    await extractFileToDisk(
      zipFileName,
      dir.path,
    );
    var entities = dir.listSync();
    var backupFolders = entities.where((x) {
      return x is Directory && x.path.contains('Mala backup');
    });
    if (backupFolders.isEmpty) {
      throw Exception('No backup folder found after extraction.');
    }
    var backupFolder = backupFolders.first;
    var sep = Platform.pathSeparator;
    var picturesFolder = Directory(backupFolder.path);
    var picFolderExists = picturesFolder.existsSync();
    Future<Uint8List?> getPic(int id) async {
      if (!picFolderExists) {
        return null;
      }
      var file = await getPictureFile(
        id,
        basePath: picturesFolder.path,
      );
      var exists = file.existsSync();
      if (exists) {
        return file.readAsBytes();
      }
      return null;
    }

    try {
      var filename = backupFolder.path + sep + getExportPatientsFileName();
      var patients = await loadPatientsFromJson(
        filename: filename,
      );
      var chuncks = patients.chunck(50);
      var added = <Patient>[];
      for (int i = 0; i < chuncks.length; i++) {
        var chunck = chuncks.elementAt(i);
        var creationDates =
            chunck.map((x) => x.createdAt).whereType<DateTime>();
        var foundAlreadySaved = await listByCreation(creationDates);
        bool hasCreated(DateTime dt) {
          return foundAlreadySaved.any((x) => x.createdAt == dt);
        }

        var newRecords = chunck.where((x) {
          var createdAt = x.createdAt;
          if (createdAt == null) return true;
          return !hasCreated(createdAt);
        });
        for (var record in newRecords) {
          var picData = await getPic(record.id);
          record.id = Isar.autoIncrement;
          await upsertPatient(
            record,
            pictureData: picData,
            waitForBackgroundUpload: true,
          );
        }
        added.addAll(newRecords);

        double percentage = (i + 1) / chuncks.length;
        onProgress?.call(percentage);

        // To implement already existing restoration of users, each user would
        // need to be reviewed to every change OR the system could
        // automatically pick the must recent updated.

        // var existingRecords = chunck.where((x) {
        //   var createdAt = x.createdAt;
        //   if (createdAt == null) return false;
        //   return hasCreated(createdAt);
        // });
      }
      return added;
    } finally {
      await backupFolder.delete(
        recursive: true,
      );
    }
  }

  QueryBuilder<Patient, Patient, QAfterSortBy> _buildQuery(PatientQuery query) {
    var r = isar.patients.filter().nameContains(query.name ?? '');
    if (query.isEmptyQuery) {
      return r.sortByName();
    }
    var filter = r;
    if (query.minAge != null || query.maxAge != null) {
      filter = filter.yearOfBirthIsNotNull();
    }
    var now = DateTime.now();
    if (query.minAge != null) {
      var value = now.year - query.minAge!;
      filter = filter.yearOfBirthLessThan(value);
    }
    if (query.maxAge != null) {
      var value = now.year - query.maxAge!;
      filter = filter.yearOfBirthGreaterThan(value);
    }
    if (query.monthBirthday) {
      filter = filter.monthOfBirthIsNotNull().monthOfBirthEqualTo(now.month);
    }
    if (query.hasActivities) {
      filter = filter.activitiesIdLengthGreaterThan(0);
      for (var activity in query.activies!) {
        filter = filter.activitiesIdElementEqualTo(activity.index);
      }
    }
    if (!query.hasDistrict && !query.hasStreet) {
      return filter.nameContains('').sortByName();
    }
    return filter.address((q) {
      if (query.hasDistrict && query.hasStreet) {
        return q
            .districtContains(query.district!)
            .streetContains(query.street!);
      } else if (query.hasDistrict) {
        return q.districtContains(query.district!);
      } else {
        return q.streetContains(query.street!);
      }
    }).sortByName();
  }
}
