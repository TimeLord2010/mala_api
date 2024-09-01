import 'package:mala_api/src/data/entities/patient.dart';
import 'package:mala_api/src/data/models/patient_query.dart';
import 'package:mala_api/src/usecases/entities/patient/export_patients.dart';

import '../factories/create_patient_repository.dart';
import '../repositories/patient_repository/hybrid_patient_repository.dart';
import '../repositories/patient_repository/local_patient_repository.dart';

class FileModule {
  Future<void> export({
    required PatientQuery query,
    required String outputDir,
    required void Function({
      required String event,
      required double progress,
      String? message,
    }) onProgress,
  }) async {
    await exportPatients(
      query: query,
      outputDir: outputDir,
      onProgress: onProgress,
    );
  }

  /// Loads a json file and parsed it into a list of patients, those patients
  /// are them added to the local storage.
  Future<List<Patient>> import(
    String path, {
    required void Function(double progress) onProgress,
  }) async {
    var rep = await createPatientRepository();
    LocalPatientRepository? localRep = switch (rep) {
      LocalPatientRepository l => l,
      HybridPatientRepository h => h.localRepository,
      _ => null,
    };
    if (localRep == null) {
      return [];
    }
    var added = await localRep.importPatients(
      zipFileName: path,
      onProgress: onProgress,
    );

    return added;
  }
}
