import 'package:search_cep/search_cep.dart';

import '../../data/entities/address.dart';

Future<Address?> searchAddress(String cep) async {
  final postmonSearchCep = PostmonSearchCep();
  final infoCepJSON = await postmonSearchCep.searchInfoByCep(
    cep: cep,
    //returnType: PostmonReturnType.json,
  );
  // final viaCepSearchCep = ViaCepSearchCep();
  // final infoCepJSON = await viaCepSearchCep.searchInfoByCep(
  //   cep: cep,
  //   returnType: SearchInfoType.json,
  // );
  var infos = infoCepJSON.toIterable();
  if (infos.isEmpty) {
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
