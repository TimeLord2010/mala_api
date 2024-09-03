import 'dart:async';
import 'dart:typed_data';

import 'package:mala_api/src/repositories/index.dart';

import '../data/entities/address.dart';
import '../data/entities/patient.dart';
import '../data/models/patient_query.dart';
import '../usecases/entities/index.dart';

class PatientModule {
  final semaphore = PatientsSemaphore();
  final patientUploadController = StreamController<Patient>();
  final patientDeletedController = StreamController<int>();
  final errorController = StreamController<Exception>();

  Future<Address?> searchCep(String cep) {
    return searchAddress(cep);
  }

  Future<void> upsert(Patient patient, Uint8List? pictureData) async {
    await upsertPatient(
      patient,
      pictureData: pictureData,
      onUpload: () {
        patientUploadController.add(patient);
      },
      onUploadFail: (err) {
        if (err is Exception) errorController.add(err);
      },
    );
  }

  Future<void> delete(Patient patient) async {
    await deletePatient(
      patient,
      onUpload: () {
        patientDeletedController.add(patient.id);
      },
      onUploadError: (err) {
        if (err is Exception) errorController.add(err);
      },
    );
  }

  Future<List<Patient>> list({
    PatientQuery? query,
    int? skip,
    int? limit,
  }) async {
    var patients = await listPatients(
      patientQuery: query ?? PatientQuery(),
      skip: skip,
      limit: limit,
    );
    return patients;
  }

  Future<int> count([PatientQuery? query]) async {
    if (query == null) {
      return countAllPatients();
    }
    var count = await countPatients(query);
    return count;
  }
}
