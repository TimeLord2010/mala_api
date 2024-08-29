import 'dart:io';

import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../entities/patient/profile_picture/get_patients_pictures_folder.dart';
import '../http/set_jwt_header.dart';
import 'delete_database_files.dart';

Future<void> deleteUserFiles() async {
  await deleteDatabaseFiles();
  await GetIt.I.get<SharedPreferences>().clear();
  setJwtHeader(null);
  var dir = Directory(await getPatientsPicturesFolder());
  var exists = dir.existsSync();
  if (exists) {
    await dir.delete(recursive: true);
  }
  await Future.delayed(const Duration(milliseconds: 500));
}
