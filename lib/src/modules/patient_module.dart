import 'dart:async';
import 'dart:typed_data';

import 'package:mala_api/src/repositories/index.dart';

import '../data/entities/address.dart';
import '../data/entities/patient.dart';
import '../data/models/patient_query.dart';
import '../factories/logger.dart';
import '../usecases/entities/index.dart';
import '../usecases/object/error/get_error_message.dart';

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

  /// Loads a picture from the local storage.
  ///
  /// If no picture is found, then the patient model is checked to see it there
  /// should exist a image. And if so, fetches it from the api.
  Future<Uint8List?> loadPicture(
    Patient patient, {
    required void Function(Future<Uint8List?> data) onDataLoad,
  }) async {
    try {
      var id = patient.id;
      var data = loadProfilePicture(id);
      onDataLoad(data);

      // Ensuring there is not picture.

      var resolvedData = await data;

      // If local data is found, then check is aborted.
      if (resolvedData != null) {
        return null;
      }

      var mayHavePicture = patient.hasPicture != false;

      // If the record signals there is not picture, then we trust it.
      if (!mayHavePicture) {
        return null;
      }

      var rep = PatientApiRepository();
      var remoteId = patient.remoteId;

      // When can only talk to the backend if we have the remoteId.
      if (remoteId == null) {
        return null;
      }

      // Loading picture from server
      var apiDataFuture = rep.getPicture(remoteId);
      onDataLoad(apiDataFuture);
      var apiData = await apiDataFuture;

      if (apiData == null) {
        // No data found after all.
        logger.warn('Updating local patient $remoteId to flag no picture');
        patient.hasPicture = false;

        // Fixing the patient model to flag no picture.
        await upsertPatient(
          patient,
          ignorePicture: true,
          syncWithServer: false,
        );
        return null;
      }

      await saveOrRemoveProfilePicture(
        patientId: patient.id,
        data: apiData,
      );
    } catch (e, stack) {
      unawaited(insertRemoteLog(
        context: 'Carregando imagem de paciente',
        message: getErrorMessage(e) ?? 'Falha ao carregar imagem de paciente',
        stack: stack.toString(),
        extras: {
          'id': patient.remoteId,
        },
      ));
    }
    return null;
  }

  Future<void> savePicture(int id, [Uint8List? data]) async {
    await saveOrRemoveProfilePicture(
      patientId: id,
      data: data,
    );
  }
}
