import 'dart:io';
import 'dart:typed_data';

import 'package:archive/archive_io.dart';
import 'package:mala_api/src/data/entities/address.dart';
import 'package:mala_api/src/data/entities/patient.dart';
import 'package:mala_api/src/data/interfaces/patient_interface.dart';
import 'package:mala_api/src/data/models/patient_query.dart';
import 'package:mala_api/src/database/query_builder.dart';
import 'package:mala_api/src/factories/logger.dart';
import 'package:mala_api/src/usecases/entities/index.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqlite3/sqlite3.dart';
import 'package:vit_dart_extensions/vit_dart_extensions.dart';

import '../../usecases/file/get_export_patients_file_name.dart';

class LocalPatientRepository extends PatientInterface<int> {
  final Database db;

  LocalPatientRepository(this.db);

  final _logger = createSdkLogger('LocalPatientRepository');

  @override
  Future<int> count([PatientQuery? query]) async {
    if (query == null) {
      final result = db.select('SELECT COUNT(*) as count FROM patients');
      return result.first['count'] as int;
    }

    final queryBuilder = SQLQueryBuilder.fromPatientQuery(query);
    final whereClause = queryBuilder.buildWhereClause();

    final sql = '''
      SELECT COUNT(*) as count
      FROM patients p
      LEFT JOIN addresses a ON p.address_id = a.id
      $whereClause
    ''';

    final result = db.select(sql, queryBuilder.arguments);
    return result.first['count'] as int;
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
    final queryBuilder = SQLQueryBuilder.fromPatientQuery(query);
    final whereClause = queryBuilder.buildWhereClause();

    final sql = '''
      SELECT p.*, a.id as address_id, a.zip_code, a.state, a.city,
             a.district, a.street, a.number, a.complement
      FROM patients p
      LEFT JOIN addresses a ON p.address_id = a.id
      $whereClause
      ORDER BY p.name COLLATE NOCASE
      LIMIT ? OFFSET ?
    ''';

    final args = [...queryBuilder.arguments, limit ?? 60, skip ?? 0];
    final result = db.select(sql, args);

    return result.map((row) => _mapRowToPatient(row)).toList();
  }

  @override
  Future<Patient> upsert(Patient patient) async {
    // Upsert address first if exists
    int? addressId;
    if (patient.address != null) {
      addressId = await _upsertAddress(patient.address!);
    }

    // Upsert patient
    if (patient.id == 0) {
      // Insert new patient
      db.execute('''
        INSERT INTO patients (
          remote_id, has_picture, name, cpf, mother_name,
          observation, year_of_birth, month_of_birth, day_of_birth,
          created_at, updated_at, address_id
        ) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)
      ''', [
        patient.remoteId,
        patient.hasPicture == true ? 1 : 0,
        patient.name,
        patient.cpf,
        patient.motherName,
        patient.observation,
        patient.yearOfBirth,
        patient.monthOfBirth,
        patient.dayOfBirth,
        patient.createdAt?.toIso8601String(),
        patient.updatedAt?.toIso8601String(),
        addressId,
      ]);

      patient.id = db.lastInsertRowId;
      _logger.i('New id: ${patient.id}');
    } else {
      // Update existing patient
      db.execute('''
        UPDATE patients SET
          remote_id = ?, has_picture = ?, name = ?, cpf = ?,
          mother_name = ?, observation = ?, year_of_birth = ?,
          month_of_birth = ?, day_of_birth = ?, created_at = ?,
          updated_at = ?, address_id = ?
        WHERE id = ?
      ''', [
        patient.remoteId,
        patient.hasPicture == true ? 1 : 0,
        patient.name,
        patient.cpf,
        patient.motherName,
        patient.observation,
        patient.yearOfBirth,
        patient.monthOfBirth,
        patient.dayOfBirth,
        patient.createdAt?.toIso8601String(),
        patient.updatedAt?.toIso8601String(),
        addressId,
        patient.id,
      ]);
    }

    // Update phones (delete and re-insert)
    db.execute('DELETE FROM patient_phones WHERE patient_id = ?', [patient.id]);
    if (patient.phones != null && patient.phones!.isNotEmpty) {
      for (final phone in patient.phones!) {
        db.execute('''
          INSERT INTO patient_phones (patient_id, phone_number)
          VALUES (?, ?)
        ''', [patient.id, phone]);
      }
    }

    // Update activities (delete and re-insert)
    db.execute('DELETE FROM patient_activities WHERE patient_id = ?', [patient.id]);
    if (patient.activitiesId != null && patient.activitiesId!.isNotEmpty) {
      for (final activityId in patient.activitiesId!) {
        db.execute('''
          INSERT INTO patient_activities (patient_id, activity_id)
          VALUES (?, ?)
        ''', [patient.id, activityId]);
      }
    }

    return patient;
  }

  Future<int> _upsertAddress(Address address) async {
    if (address.id == 0) {
      db.execute('''
        INSERT INTO addresses (
          zip_code, state, city, district, street, number, complement
        ) VALUES (?, ?, ?, ?, ?, ?, ?)
      ''', [
        address.zipCode,
        address.state,
        address.city,
        address.district,
        address.street,
        address.number,
        address.complement,
      ]);
      address.id = db.lastInsertRowId;
      return address.id;
    } else {
      db.execute('''
        UPDATE addresses SET
          zip_code = ?, state = ?, city = ?, district = ?,
          street = ?, number = ?, complement = ?
        WHERE id = ?
      ''', [
        address.zipCode,
        address.state,
        address.city,
        address.district,
        address.street,
        address.number,
        address.complement,
        address.id,
      ]);
      return address.id;
    }
  }

  Patient _mapRowToPatient(Row row) {
    // Extract patient fields
    final patient = Patient(
      remoteId: row['remote_id'] as String?,
      hasPicture: (row['has_picture'] as int?) == 1,
      name: row['name'] as String?,
      cpf: row['cpf'] as String?,
      motherName: row['mother_name'] as String?,
      observation: row['observation'] as String?,
      yearOfBirth: row['year_of_birth'] as int?,
      monthOfBirth: row['month_of_birth'] as int?,
      dayOfBirth: row['day_of_birth'] as int?,
      createdAt: _parseDateTime(row['created_at'] as String?),
      updatedAt: _parseDateTime(row['updated_at'] as String?),
    );
    patient.id = row['id'] as int;

    // Load address if exists
    final addressId = row['address_id'];
    if (addressId != null) {
      patient.address = Address(
        zipCode: row['zip_code'] as String?,
        state: row['state'] as String?,
        city: row['city'] as String?,
        district: row['district'] as String?,
        street: row['street'] as String?,
        number: row['number'] as String?,
        complement: row['complement'] as String?,
      );
      patient.address!.id = addressId as int;
    }

    // Load phones
    final phoneResult = db.select(
      'SELECT phone_number FROM patient_phones WHERE patient_id = ? ORDER BY id',
      [patient.id],
    );
    patient.phones = phoneResult.map((r) => r['phone_number'] as String).toList();

    // Load activities
    final activityResult = db.select(
      'SELECT activity_id FROM patient_activities WHERE patient_id = ? ORDER BY activity_id',
      [patient.id],
    );
    patient.activitiesId = activityResult.map((r) => r['activity_id'] as int).toList();

    return patient;
  }

  DateTime? _parseDateTime(String? iso) {
    if (iso == null) return null;
    return DateTime.parse(iso);
  }

  /// Fetches the patients who do not have the "remoteId" field set.
  Future<List<Patient>> findLocalPatients({
    required int skip,
    required int limit,
  }) {
    final result = db.select('''
      SELECT p.*, a.id as address_id, a.zip_code, a.state, a.city,
             a.district, a.street, a.number, a.complement
      FROM patients p
      LEFT JOIN addresses a ON p.address_id = a.id
      WHERE p.remote_id IS NULL
      LIMIT ? OFFSET ?
    ''', [limit, skip]);

    return Future.value(result.map((row) => _mapRowToPatient(row)).toList());
  }

  @override
  Future<Patient?> getById(int id) async {
    var intId = getId(id);
    final result = db.select('''
      SELECT p.*, a.id as address_id, a.zip_code, a.state, a.city,
             a.district, a.street, a.number, a.complement
      FROM patients p
      LEFT JOIN addresses a ON p.address_id = a.id
      WHERE p.id = ?
    ''', [intId]);

    if (result.isEmpty) return null;

    return _mapRowToPatient(result.first);
  }

  @override
  Future<Iterable<Patient>> listByCreation(Iterable<DateTime> createdAts) {
    if (createdAts.isEmpty) return Future.value([]);

    final placeholders = createdAts.map((_) => '?').join(',');
    final isoStrings = createdAts.map((dt) => dt.toIso8601String()).toList();

    final result = db.select('''
      SELECT p.*, a.id as address_id, a.zip_code, a.state, a.city,
             a.district, a.street, a.number, a.complement
      FROM patients p
      LEFT JOIN addresses a ON p.address_id = a.id
      WHERE p.created_at IN ($placeholders)
    ''', isoStrings);

    return Future.value(result.map((row) => _mapRowToPatient(row)).toList());
  }

  Future<List<Patient>> findByIds(List<int> ids) {
    if (ids.isEmpty) return Future.value([]);

    final placeholders = ids.map((_) => '?').join(',');
    final result = db.select('''
      SELECT p.*, a.id as address_id, a.zip_code, a.state, a.city,
             a.district, a.street, a.number, a.complement
      FROM patients p
      LEFT JOIN addresses a ON p.address_id = a.id
      WHERE p.id IN ($placeholders)
    ''', ids);

    return Future.value(result.map((row) => _mapRowToPatient(row)).toList());
  }

  Future<int?> findIdByRemoteId(String remoteId) async {
    final result = db.select(
      'SELECT id FROM patients WHERE remote_id = ?',
      [remoteId],
    );

    if (result.isEmpty) return null;
    return result.first['id'] as int;
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
    // Foreign key constraints will cascade delete phones and activities
    db.execute('DELETE FROM patients WHERE id = ?', [id]);
  }

  Future<List<Patient>> importPatients({
    required String zipFileName,
    void Function(double progress)? onProgress,
  }) async {
    var dir = await getApplicationDocumentsDirectory();
    _logger.i('zipFile: $zipFileName');
    await extractFileToDisk(zipFileName, dir.path);
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
      var file = await getPictureFile(id, basePath: picturesFolder.path);
      var exists = file.existsSync();
      if (exists) {
        return file.readAsBytes();
      }
      return null;
    }

    try {
      var filename = backupFolder.path + sep + getExportPatientsFileName();
      var patients = await loadPatientsFromJson(filename: filename);
      var chuncks = patients.chunck(50);
      var added = <Patient>[];
      for (int i = 0; i < chuncks.length; i++) {
        var chunck = chuncks.elementAt(i);
        var creationDates = chunck.map((x) => x.createdAt).whereType<DateTime>();
        var foundAlreadySaved = await listByCreation(creationDates);
        bool hasCreated(DateTime dt) {
          return foundAlreadySaved.any((x) => x.createdAt == dt);
        }

        var newRecords = chunck.where((x) {
          var createdAt = x.createdAt;
          if (createdAt == null) return true;
          return !hasCreated(createdAt);
        });
        for (Patient record in newRecords) {
          var picData = await getPic(record.id);
          record.id = 0; // Reset to insert as new
          await upsert(record);
          await saveOrRemoveProfilePicture(patientId: record.id, data: picData);
        }
        added.addAll(newRecords);

        double percentage = (i + 1) / chuncks.length;
        onProgress?.call(percentage);
      }
      return added;
    } finally {
      await backupFolder.delete(recursive: true);
    }
  }
}
