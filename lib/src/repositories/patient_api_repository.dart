import 'dart:io';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:mala_api/src/data/entities/patient.dart';
import 'package:mala_api/src/data/responses/get_patient_changes_response.dart';
import 'package:mala_api/src/data/responses/post_patient_changes_response.dart';
import 'package:mala_api/src/factories/http_client.dart';
import 'package:vit_dart_extensions/vit_dart_extensions_io.dart';

import '../factories/logger.dart';

class PatientApiRepository {
  Future<GetPatientChangesResponse> getServerChanges() async {
    var response = await dio.get('/patient/sync');
    Map<String, dynamic> body = response.data;
    var result = GetPatientChangesResponse.fromMap(body);
    var dates = result.dates;
    if (dates != null &&
        (dates.finalDate != null || dates.initialDate != null)) {
      var initialDate = dates.initialDate?.toIso8601String();
      var finalDate = dates.finalDate?.toIso8601String();
      logger.debug(
          '(PatientApiRepository.getServerChanges) dates: $initialDate - $finalDate');
    }
    return result;
  }

  Future<PostPatientChangesResponse> postChanges({
    List<Patient>? changed,
    List<String>? deleted,
  }) async {
    var payload = {
      'changed': (changed ?? []).map((x) {
        var toApiMap = x.toApiMap;
        return toApiMap;
      }).toList(),
      'deleted': (deleted ?? []),
    };
    var response = await dio.post(
      '/patient/sync',
      data: payload,
    );
    Map<String, dynamic> data = response.data;
    return PostPatientChangesResponse.fromMap(data);
  }

  Future<void> updatePicture({
    required String patientId,
    required File file,
  }) async {
    String extension = file.fileExtension!;
    var uploadUrl = await _getUploadUrl(patientId, extension);
    var data = await file.readAsBytes();
    await dio.put(
      uploadUrl,
      data: data,
      options: Options(
        headers: {
          'Content-Type': 'application/octet-stream',
        },
      ),
    );
  }

  /// Fetches the picture data to the appropriate file.
  Future<void> savePicture(String patientId, String path) async {
    var downloadUrl = await _getDownloadUrl(patientId);
    if (downloadUrl == null) {
      return;
    }
    await dio.download(downloadUrl, path);
  }

  /// Fetches the profile picture data.
  Future<Uint8List?> getPicture(String remoteId) async {
    var downloadUrl = await _getDownloadUrl(remoteId);
    if (downloadUrl == null) {
      return null;
    }
    var response = await dio.get(
      downloadUrl,
      options: Options(
        responseType: ResponseType.bytes,
      ),
    );
    var data = response.data;
    if (data is String) {
      data = Uint8List.fromList(data.codeUnits);
    }
    if (data is Uint8List) {
      Uint8List bytes = data;
      return bytes;
    }
    throw Exception(
        'Failed to load picture: Data was not a list of bytes: Type found=${data.runtimeType}');
  }

  Future<String?> _getDownloadUrl(String remoteId) async {
    try {
      var url = '/patient/picture/download';
      var response = await dio.get(
        url,
        queryParameters: {
          'patientId': remoteId,
        },
      );
      String downloadUrl = response.data;
      return downloadUrl;
    } on DioException catch (e) {
      var response = e.response;
      if (response != null) {
        var code = response.statusCode;
        if (code == 404) {
          return null;
        }
      }
      rethrow;
    }
  }

  Future<String> _getUploadUrl(String patientId, String extension) async {
    var url = '/patient/picture/upload';
    var response = await dio.get(
      url,
      queryParameters: {
        'patientId': patientId,
        'extension': extension,
      },
    );
    String uploadUrl = response.data;
    return uploadUrl;
  }

  Future<void> deletePicture({required String patientId}) async {
    await dio.delete(
      '/patient/picture',
      queryParameters: {
        'patientId': patientId,
      },
    );
  }
}
