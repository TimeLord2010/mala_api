import 'dart:async';

import 'package:mala_api/src/usecases/entities/patient/local_upsert_patient.dart';

import '../../data/entities/patient.dart';
import '../../data/interfaces/patient_interface.dart';
import '../../data/models/patient_query.dart';
import '../../data/responses/get_patient_changes_response.dart';
import '../../factories/logger.dart';
import '../../usecases/entities/logs/insert_remote_log.dart';
import '../../usecases/object/error/get_error_message.dart';
import '../../usecases/object/number/average.dart';
import '../handlers/stop_watch_events.dart';
import '../patient_api_repository.dart';
import 'local_patient_repository.dart';
import 'online_patient_repository.dart';

class HybridPatientRepository extends PatientInterface<String> {
  final LocalPatientRepository localRepository;
  final OnlinePatientRepository onlineRepository;

  final StreamController<Patient> updatedStream;

  HybridPatientRepository({
    required this.localRepository,
    required this.onlineRepository,
    required this.updatedStream,
  });

  @override
  Future<int> count([PatientQuery? query]) {
    return localRepository.count(query);
  }

  @override
  Future<void> delete(Patient patient) async {
    await onlineRepository.delete(patient);
    await localRepository.delete(patient);
  }

  @override
  Future<Iterable<Patient>> list(
    PatientQuery query, {
    int? skip,
    int? limit,
  }) {
    return localRepository.list(
      query,
      skip: skip,
      limit: limit,
    );
  }

  @override
  Future<Patient> upsert(Patient patient) async {
    var localPatient = await localRepository.upsert(patient);
    var uploadFuture = onlineRepository.upsert(localPatient);
    unawaited(uploadFuture.then((v) {
      updatedStream.add(v);
    }).catchError((err) {
      updatedStream.addError(err);
    }));
    return localPatient;
  }

  Future<void> sendAllToApi() async {
    var limit = 100;
    while (true) {
      var patients =
          await localRepository.findLocalPatients(skip: 0, limit: limit);
      if (patients.isEmpty) break;
      await onlineRepository.postPatientsChanges(
        changed: patients,
      );
      unawaited(insertRemoteLog(
        message: 'Sending ${patients.length} local patients',
        context: 'Send local patients to server',
        extras: {
          'creationDates': patients.map((x) => x.createdAt).toList(),
        },
      ));
    }
  }

  /// Fetches the changes of patients (either new, updated or deleted) and
  /// commit then to the local storage.
  ///
  /// This method will fetch the patients in pages by repeatadly checking in
  /// the server for changes until there is none.
  Future<void> updatePatientsFromServerByPieces({
    void Function(String? lastSync)? updater,
    bool Function()? didCancel,
  }) async {
    var begin = DateTime.now();

    var eventTimes = StopWatchEvents();

    Future<GetPatientChangesResponse> fetch() async {
      var newPatients = await eventTimes.add(() async {
        var patientsRep = PatientApiRepository();
        return await patientsRep
            .getServerChanges()
            .timeout(const Duration(seconds: 6));
      });
      return newPatients;
    }

    DateTime? lastServerDate;
    void setLastServerDate(DateTime dt) {
      if (lastServerDate == null) {
        lastServerDate = dt;
        return;
      }
      if (dt.isAfter(lastServerDate!) ||
          dt.millisecondsSinceEpoch == lastServerDate!.millisecondsSinceEpoch) {
        lastServerDate = dt;
      }
    }

    Map<String, dynamic> getExtras() {
      var inMilli = eventTimes.inMilli;
      return {
        'ApiDelays': inMilli,
        'ApiDelayAvg': average(inMilli),
        'elapsed': '${DateTime.now().difference(begin).inSeconds}s',
      };
    }

    /// List of ids to check cycles in the fetch loop.
    var ids = <String>{};

    try {
      while (true) {
        if (didCancel != null && didCancel()) {
          logger.warn('Aborting sync since the called canceled');
          break;
        }
        var response = await fetch();
        logger.info('Found ${response.length} to sync from server');
        if (response.isEmpty) {
          logger.info('Completed fetch changes');
          break;
        }

        // Breaking cycles
        var currentIds = response.changed.map((x) => x.remoteId!).toSet();
        if (ids.isNotEmpty && currentIds.every((x) => ids.contains(x))) {
          logger.warn('Sync finished because every id is the same as before');
          break;
        }
        ids.clear();
        ids.addAll(currentIds);
        logger.debug('Scanning ids: $currentIds');

        for (var patient in response.changed) {
          var remoteId = patient.remoteId!;
          var localId = await localRepository.findIdByRemoteId(remoteId);
          if (localId != null) {
            logger.warn('Local patient found with same remote id when syncing');
            patient.id = localId;
          }
          await localUpsertPatient(patient);
          setLastServerDate(patient.uploadedAt!);
        }
        for (var deleteRecord in response.deleted) {
          for (var patientRemoteId in deleteRecord.patientIds) {
            var localId =
                await localRepository.findIdByRemoteId(patientRemoteId);
            if (localId == null) {
              logger.warn('Did not found patient to delete: $patientRemoteId');
              continue;
            }
            await localRepository.deleteById(localId);
          }
          // setLastServerDate(deleteRecord.disabledAt);
        }
        // if (response.changed.isEmpty) {
        //   if (response.deleted.isEmpty) {
        //     break;
        //   } else {
        //     var last = response.deleted.last;
        //     setLastServerDate(last.disabledAt);
        //     await updateSavedLastSync();
        //   }
        // } else {
        //   await updateSavedLastSync();
        // }
        if (didCancel != null) {
          if (!didCancel()) updater?.call(lastServerDate?.toIso8601String());
        } else {
          updater?.call(lastServerDate?.toIso8601String());
        }
      }
      unawaited(insertRemoteLog(
        message: 'Finished syncing',
        context: 'Sync patients',
        extras: getExtras(),
      ));
    } catch (e) {
      var msg = getErrorMessage(e) ?? '?';
      unawaited(insertRemoteLog(
        message: msg,
        context: 'Sync patients',
        extras: getExtras(),
      ));
      rethrow;
    }
  }

  @override
  Future<Iterable<Patient>> listByCreation(Iterable<DateTime> createdAts) {
    return localRepository.listByCreation(createdAts);
  }

  @override
  Future<Patient?> getById(String id) {
    var parsedId = localRepository.getId(id);
    return localRepository.getById(parsedId);
  }

  @override
  Future<void> deleteById(String id) async {
    var localId = localRepository.getId(id);
    await localRepository.deleteById(localId);
    await onlineRepository.deleteById(id);
  }
}
