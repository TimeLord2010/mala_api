import 'package:mala_api/src/factories/http_client.dart';

void setJwtHeader(String? jwt) {
  var headers = dio.options.headers;
  if (jwt == null) {
    headers.remove('jwt');
  } else {
    headers['jwt'] = jwt;
  }
}
