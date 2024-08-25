import 'package:isar/isar.dart';
import 'package:mala_api/src/data/models/configuration.dart';

import '../data/entities/address.dart';
import '../data/entities/patient.dart';
import '../usecases/file/get_database_directory.dart';
import 'logger.dart';

Isar? _isar;

Future<Isar> createDatabaseClient() async {
  if (_isar == null) {
    final dir = await getDatabaseDirectory();
    logger.info('Database directory: ${dir.path}');
    _isar = await Isar.open(
      [PatientSchema, AddressSchema],
      directory: dir.path,
      inspector: Configuration.isDebugMode,
      compactOnLaunch: const CompactCondition(
        minRatio: 1.5,
      ),
    );
  }
  return _isar!;
}

void destroyDatabaseClient() {
  _isar = null;
}
