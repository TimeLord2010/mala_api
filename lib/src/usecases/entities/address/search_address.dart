import 'package:search_cep/search_cep.dart';

import '../../../data/entities/address.dart';
import '../../../factories/logger.dart';

Future<Address?> searchAddress(String cep) async {
  var logger = createSdkLogger('searchAddress');

  var postmonSearchCep = PostmonSearchCep();
  var infoCepJSON = await postmonSearchCep.searchInfoByCep(cep: cep);

  var hasError = infoCepJSON.isLeft();
  if (hasError) {
    infoCepJSON.leftMap((x) {
      logger.e('Postmon search error: $x');
    });
  }

  var infos = infoCepJSON.toIterable();
  if (infos.isEmpty) {
    var viaCepSearchCep = ViaCepSearchCep();
    var viaCep = await viaCepSearchCep.searchInfoByCep(cep: cep);
    var founds = viaCep.toIterable();
    if (founds.isNotEmpty) {
      var found = founds.first;
      return Address(
        zipCode: found.cep,
        city: found.localidade,
        state: found.uf,
        street: found.logradouro,
        district: found.bairro,
      );
    }
    return null;
  }

  var info = infos.first;
  return Address(
    zipCode: info.cep,
    city: info.cidade,
    state: info.estado,
    street: info.logradouro,
    district: info.bairro,
  );
}
