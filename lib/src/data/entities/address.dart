class Address {
  int id = 0;

  String? zipCode;
  String? state;
  String? city;

  String? district;

  String? street;

  String? number;
  String? complement;

  Address({
    this.city,
    this.district,
    this.number,
    this.state,
    this.street,
    this.zipCode,
    this.complement,
  });

  factory Address.fromMap(Map<String, dynamic> map) {
    var a = Address(
      zipCode: map['zipCode'],
      state: map['state'],
      city: map['city'],
      district: map['district'],
      street: map['street'],
      number: map['number'],
      complement: map['complement'],
    );
    map['id'] = map['id'];
    return a;
  }

  Map<String, dynamic> get toMap {
    return {
      'id': id,
      if (zipCode?.isNotEmpty ?? false) ...{'zipCode': zipCode},
      if (state?.isNotEmpty ?? false) ...{'state': state},
      if (city?.isNotEmpty ?? false) ...{'city': city},
      if (district?.isNotEmpty ?? false) ...{'district': district},
      if (street?.isNotEmpty ?? false) ...{'street': street},
      if (number?.isNotEmpty ?? false) ...{'number': number},
      if (complement?.isNotEmpty ?? false) ...{'complement': complement},
    };
  }
}
