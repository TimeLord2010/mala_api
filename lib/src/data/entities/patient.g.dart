// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'patient.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetPatientCollection on Isar {
  IsarCollection<Patient> get patients => this.collection();
}

const PatientSchema = CollectionSchema(
  name: r'Patient',
  id: -3057427754190339924,
  properties: {
    r'activitiesId': PropertySchema(
      id: 0,
      name: r'activitiesId',
      type: IsarType.intList,
    ),
    r'cpf': PropertySchema(
      id: 1,
      name: r'cpf',
      type: IsarType.string,
    ),
    r'createdAt': PropertySchema(
      id: 2,
      name: r'createdAt',
      type: IsarType.dateTime,
    ),
    r'dayOfBirth': PropertySchema(
      id: 3,
      name: r'dayOfBirth',
      type: IsarType.long,
    ),
    r'hasPicture': PropertySchema(
      id: 4,
      name: r'hasPicture',
      type: IsarType.bool,
    ),
    r'monthOfBirth': PropertySchema(
      id: 5,
      name: r'monthOfBirth',
      type: IsarType.long,
    ),
    r'motherName': PropertySchema(
      id: 6,
      name: r'motherName',
      type: IsarType.string,
    ),
    r'name': PropertySchema(
      id: 7,
      name: r'name',
      type: IsarType.string,
    ),
    r'observation': PropertySchema(
      id: 8,
      name: r'observation',
      type: IsarType.string,
    ),
    r'phones': PropertySchema(
      id: 9,
      name: r'phones',
      type: IsarType.stringList,
    ),
    r'remoteId': PropertySchema(
      id: 10,
      name: r'remoteId',
      type: IsarType.string,
    ),
    r'updatedAt': PropertySchema(
      id: 11,
      name: r'updatedAt',
      type: IsarType.dateTime,
    ),
    r'yearOfBirth': PropertySchema(
      id: 12,
      name: r'yearOfBirth',
      type: IsarType.long,
    )
  },
  estimateSize: _patientEstimateSize,
  serialize: _patientSerialize,
  deserialize: _patientDeserialize,
  deserializeProp: _patientDeserializeProp,
  idName: r'id',
  indexes: {
    r'remoteIdIndex': IndexSchema(
      id: 9039549610748188408,
      name: r'remoteIdIndex',
      unique: true,
      replace: true,
      properties: [
        IndexPropertySchema(
          name: r'remoteId',
          type: IndexType.hash,
          caseSensitive: false,
        )
      ],
    ),
    r'name': IndexSchema(
      id: 879695947855722453,
      name: r'name',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'name',
          type: IndexType.value,
          caseSensitive: true,
        )
      ],
    ),
    r'cpf': IndexSchema(
      id: 1294985846216081031,
      name: r'cpf',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'cpf',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    ),
    r'yearOfBirth': IndexSchema(
      id: -5919700600550385928,
      name: r'yearOfBirth',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'yearOfBirth',
          type: IndexType.value,
          caseSensitive: false,
        )
      ],
    ),
    r'monthOfBirth': IndexSchema(
      id: -4323981611082986064,
      name: r'monthOfBirth',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'monthOfBirth',
          type: IndexType.value,
          caseSensitive: false,
        )
      ],
    ),
    r'dayOfBirth': IndexSchema(
      id: 6383132660956165335,
      name: r'dayOfBirth',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'dayOfBirth',
          type: IndexType.value,
          caseSensitive: false,
        )
      ],
    ),
    r'activitiesId': IndexSchema(
      id: -116086714938599430,
      name: r'activitiesId',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'activitiesId',
          type: IndexType.value,
          caseSensitive: false,
        )
      ],
    ),
    r'createdAt': IndexSchema(
      id: -3433535483987302584,
      name: r'createdAt',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'createdAt',
          type: IndexType.value,
          caseSensitive: false,
        )
      ],
    ),
    r'updatedAt': IndexSchema(
      id: -6238191080293565125,
      name: r'updatedAt',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'updatedAt',
          type: IndexType.value,
          caseSensitive: false,
        )
      ],
    )
  },
  links: {
    r'address': LinkSchema(
      id: 4390746915031902414,
      name: r'address',
      target: r'Address',
      single: true,
    )
  },
  embeddedSchemas: {},
  getId: _patientGetId,
  getLinks: _patientGetLinks,
  attach: _patientAttach,
  version: '3.1.0+1',
);

int _patientEstimateSize(
  Patient object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.activitiesId;
    if (value != null) {
      bytesCount += 3 + value.length * 4;
    }
  }
  {
    final value = object.cpf;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.motherName;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.name;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.observation;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final list = object.phones;
    if (list != null) {
      bytesCount += 3 + list.length * 3;
      {
        for (var i = 0; i < list.length; i++) {
          final value = list[i];
          bytesCount += value.length * 3;
        }
      }
    }
  }
  {
    final value = object.remoteId;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _patientSerialize(
  Patient object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeIntList(offsets[0], object.activitiesId);
  writer.writeString(offsets[1], object.cpf);
  writer.writeDateTime(offsets[2], object.createdAt);
  writer.writeLong(offsets[3], object.dayOfBirth);
  writer.writeBool(offsets[4], object.hasPicture);
  writer.writeLong(offsets[5], object.monthOfBirth);
  writer.writeString(offsets[6], object.motherName);
  writer.writeString(offsets[7], object.name);
  writer.writeString(offsets[8], object.observation);
  writer.writeStringList(offsets[9], object.phones);
  writer.writeString(offsets[10], object.remoteId);
  writer.writeDateTime(offsets[11], object.updatedAt);
  writer.writeLong(offsets[12], object.yearOfBirth);
}

Patient _patientDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Patient(
    activitiesId: reader.readIntList(offsets[0]),
    cpf: reader.readStringOrNull(offsets[1]),
    createdAt: reader.readDateTimeOrNull(offsets[2]),
    dayOfBirth: reader.readLongOrNull(offsets[3]),
    hasPicture: reader.readBoolOrNull(offsets[4]),
    monthOfBirth: reader.readLongOrNull(offsets[5]),
    motherName: reader.readStringOrNull(offsets[6]),
    name: reader.readStringOrNull(offsets[7]),
    observation: reader.readStringOrNull(offsets[8]),
    phones: reader.readStringList(offsets[9]),
    remoteId: reader.readStringOrNull(offsets[10]),
    updatedAt: reader.readDateTimeOrNull(offsets[11]),
    yearOfBirth: reader.readLongOrNull(offsets[12]),
  );
  object.id = id;
  return object;
}

P _patientDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readIntList(offset)) as P;
    case 1:
      return (reader.readStringOrNull(offset)) as P;
    case 2:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 3:
      return (reader.readLongOrNull(offset)) as P;
    case 4:
      return (reader.readBoolOrNull(offset)) as P;
    case 5:
      return (reader.readLongOrNull(offset)) as P;
    case 6:
      return (reader.readStringOrNull(offset)) as P;
    case 7:
      return (reader.readStringOrNull(offset)) as P;
    case 8:
      return (reader.readStringOrNull(offset)) as P;
    case 9:
      return (reader.readStringList(offset)) as P;
    case 10:
      return (reader.readStringOrNull(offset)) as P;
    case 11:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 12:
      return (reader.readLongOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _patientGetId(Patient object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _patientGetLinks(Patient object) {
  return [object.address];
}

void _patientAttach(IsarCollection<dynamic> col, Id id, Patient object) {
  object.id = id;
  object.address.attach(col, col.isar.collection<Address>(), r'address', id);
}

extension PatientByIndex on IsarCollection<Patient> {
  Future<Patient?> getByRemoteId(String? remoteId) {
    return getByIndex(r'remoteIdIndex', [remoteId]);
  }

  Patient? getByRemoteIdSync(String? remoteId) {
    return getByIndexSync(r'remoteIdIndex', [remoteId]);
  }

  Future<bool> deleteByRemoteId(String? remoteId) {
    return deleteByIndex(r'remoteIdIndex', [remoteId]);
  }

  bool deleteByRemoteIdSync(String? remoteId) {
    return deleteByIndexSync(r'remoteIdIndex', [remoteId]);
  }

  Future<List<Patient?>> getAllByRemoteId(List<String?> remoteIdValues) {
    final values = remoteIdValues.map((e) => [e]).toList();
    return getAllByIndex(r'remoteIdIndex', values);
  }

  List<Patient?> getAllByRemoteIdSync(List<String?> remoteIdValues) {
    final values = remoteIdValues.map((e) => [e]).toList();
    return getAllByIndexSync(r'remoteIdIndex', values);
  }

  Future<int> deleteAllByRemoteId(List<String?> remoteIdValues) {
    final values = remoteIdValues.map((e) => [e]).toList();
    return deleteAllByIndex(r'remoteIdIndex', values);
  }

  int deleteAllByRemoteIdSync(List<String?> remoteIdValues) {
    final values = remoteIdValues.map((e) => [e]).toList();
    return deleteAllByIndexSync(r'remoteIdIndex', values);
  }

  Future<Id> putByRemoteId(Patient object) {
    return putByIndex(r'remoteIdIndex', object);
  }

  Id putByRemoteIdSync(Patient object, {bool saveLinks = true}) {
    return putByIndexSync(r'remoteIdIndex', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByRemoteId(List<Patient> objects) {
    return putAllByIndex(r'remoteIdIndex', objects);
  }

  List<Id> putAllByRemoteIdSync(List<Patient> objects,
      {bool saveLinks = true}) {
    return putAllByIndexSync(r'remoteIdIndex', objects, saveLinks: saveLinks);
  }
}

extension PatientQueryWhereSort on QueryBuilder<Patient, Patient, QWhere> {
  QueryBuilder<Patient, Patient, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }

  QueryBuilder<Patient, Patient, QAfterWhere> anyName() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'name'),
      );
    });
  }

  QueryBuilder<Patient, Patient, QAfterWhere> anyYearOfBirth() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'yearOfBirth'),
      );
    });
  }

  QueryBuilder<Patient, Patient, QAfterWhere> anyMonthOfBirth() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'monthOfBirth'),
      );
    });
  }

  QueryBuilder<Patient, Patient, QAfterWhere> anyDayOfBirth() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'dayOfBirth'),
      );
    });
  }

  QueryBuilder<Patient, Patient, QAfterWhere> anyActivitiesIdElement() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'activitiesId'),
      );
    });
  }

  QueryBuilder<Patient, Patient, QAfterWhere> anyCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'createdAt'),
      );
    });
  }

  QueryBuilder<Patient, Patient, QAfterWhere> anyUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'updatedAt'),
      );
    });
  }
}

extension PatientQueryWhere on QueryBuilder<Patient, Patient, QWhereClause> {
  QueryBuilder<Patient, Patient, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<Patient, Patient, QAfterWhereClause> idNotEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<Patient, Patient, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<Patient, Patient, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<Patient, Patient, QAfterWhereClause> idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId,
        includeLower: includeLower,
        upper: upperId,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Patient, Patient, QAfterWhereClause> remoteIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'remoteIdIndex',
        value: [null],
      ));
    });
  }

  QueryBuilder<Patient, Patient, QAfterWhereClause> remoteIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'remoteIdIndex',
        lower: [null],
        includeLower: false,
        upper: [],
      ));
    });
  }

  QueryBuilder<Patient, Patient, QAfterWhereClause> remoteIdEqualTo(
      String? remoteId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'remoteIdIndex',
        value: [remoteId],
      ));
    });
  }

  QueryBuilder<Patient, Patient, QAfterWhereClause> remoteIdNotEqualTo(
      String? remoteId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'remoteIdIndex',
              lower: [],
              upper: [remoteId],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'remoteIdIndex',
              lower: [remoteId],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'remoteIdIndex',
              lower: [remoteId],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'remoteIdIndex',
              lower: [],
              upper: [remoteId],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<Patient, Patient, QAfterWhereClause> nameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'name',
        value: [null],
      ));
    });
  }

  QueryBuilder<Patient, Patient, QAfterWhereClause> nameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'name',
        lower: [null],
        includeLower: false,
        upper: [],
      ));
    });
  }

  QueryBuilder<Patient, Patient, QAfterWhereClause> nameEqualTo(String? name) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'name',
        value: [name],
      ));
    });
  }

  QueryBuilder<Patient, Patient, QAfterWhereClause> nameNotEqualTo(
      String? name) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'name',
              lower: [],
              upper: [name],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'name',
              lower: [name],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'name',
              lower: [name],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'name',
              lower: [],
              upper: [name],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<Patient, Patient, QAfterWhereClause> nameGreaterThan(
    String? name, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'name',
        lower: [name],
        includeLower: include,
        upper: [],
      ));
    });
  }

  QueryBuilder<Patient, Patient, QAfterWhereClause> nameLessThan(
    String? name, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'name',
        lower: [],
        upper: [name],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<Patient, Patient, QAfterWhereClause> nameBetween(
    String? lowerName,
    String? upperName, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'name',
        lower: [lowerName],
        includeLower: includeLower,
        upper: [upperName],
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Patient, Patient, QAfterWhereClause> nameStartsWith(
      String NamePrefix) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'name',
        lower: [NamePrefix],
        upper: ['$NamePrefix\u{FFFFF}'],
      ));
    });
  }

  QueryBuilder<Patient, Patient, QAfterWhereClause> nameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'name',
        value: [''],
      ));
    });
  }

  QueryBuilder<Patient, Patient, QAfterWhereClause> nameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.lessThan(
              indexName: r'name',
              upper: [''],
            ))
            .addWhereClause(IndexWhereClause.greaterThan(
              indexName: r'name',
              lower: [''],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.greaterThan(
              indexName: r'name',
              lower: [''],
            ))
            .addWhereClause(IndexWhereClause.lessThan(
              indexName: r'name',
              upper: [''],
            ));
      }
    });
  }

  QueryBuilder<Patient, Patient, QAfterWhereClause> cpfIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'cpf',
        value: [null],
      ));
    });
  }

  QueryBuilder<Patient, Patient, QAfterWhereClause> cpfIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'cpf',
        lower: [null],
        includeLower: false,
        upper: [],
      ));
    });
  }

  QueryBuilder<Patient, Patient, QAfterWhereClause> cpfEqualTo(String? cpf) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'cpf',
        value: [cpf],
      ));
    });
  }

  QueryBuilder<Patient, Patient, QAfterWhereClause> cpfNotEqualTo(String? cpf) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'cpf',
              lower: [],
              upper: [cpf],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'cpf',
              lower: [cpf],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'cpf',
              lower: [cpf],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'cpf',
              lower: [],
              upper: [cpf],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<Patient, Patient, QAfterWhereClause> yearOfBirthIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'yearOfBirth',
        value: [null],
      ));
    });
  }

  QueryBuilder<Patient, Patient, QAfterWhereClause> yearOfBirthIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'yearOfBirth',
        lower: [null],
        includeLower: false,
        upper: [],
      ));
    });
  }

  QueryBuilder<Patient, Patient, QAfterWhereClause> yearOfBirthEqualTo(
      int? yearOfBirth) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'yearOfBirth',
        value: [yearOfBirth],
      ));
    });
  }

  QueryBuilder<Patient, Patient, QAfterWhereClause> yearOfBirthNotEqualTo(
      int? yearOfBirth) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'yearOfBirth',
              lower: [],
              upper: [yearOfBirth],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'yearOfBirth',
              lower: [yearOfBirth],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'yearOfBirth',
              lower: [yearOfBirth],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'yearOfBirth',
              lower: [],
              upper: [yearOfBirth],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<Patient, Patient, QAfterWhereClause> yearOfBirthGreaterThan(
    int? yearOfBirth, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'yearOfBirth',
        lower: [yearOfBirth],
        includeLower: include,
        upper: [],
      ));
    });
  }

  QueryBuilder<Patient, Patient, QAfterWhereClause> yearOfBirthLessThan(
    int? yearOfBirth, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'yearOfBirth',
        lower: [],
        upper: [yearOfBirth],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<Patient, Patient, QAfterWhereClause> yearOfBirthBetween(
    int? lowerYearOfBirth,
    int? upperYearOfBirth, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'yearOfBirth',
        lower: [lowerYearOfBirth],
        includeLower: includeLower,
        upper: [upperYearOfBirth],
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Patient, Patient, QAfterWhereClause> monthOfBirthIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'monthOfBirth',
        value: [null],
      ));
    });
  }

  QueryBuilder<Patient, Patient, QAfterWhereClause> monthOfBirthIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'monthOfBirth',
        lower: [null],
        includeLower: false,
        upper: [],
      ));
    });
  }

  QueryBuilder<Patient, Patient, QAfterWhereClause> monthOfBirthEqualTo(
      int? monthOfBirth) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'monthOfBirth',
        value: [monthOfBirth],
      ));
    });
  }

  QueryBuilder<Patient, Patient, QAfterWhereClause> monthOfBirthNotEqualTo(
      int? monthOfBirth) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'monthOfBirth',
              lower: [],
              upper: [monthOfBirth],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'monthOfBirth',
              lower: [monthOfBirth],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'monthOfBirth',
              lower: [monthOfBirth],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'monthOfBirth',
              lower: [],
              upper: [monthOfBirth],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<Patient, Patient, QAfterWhereClause> monthOfBirthGreaterThan(
    int? monthOfBirth, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'monthOfBirth',
        lower: [monthOfBirth],
        includeLower: include,
        upper: [],
      ));
    });
  }

  QueryBuilder<Patient, Patient, QAfterWhereClause> monthOfBirthLessThan(
    int? monthOfBirth, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'monthOfBirth',
        lower: [],
        upper: [monthOfBirth],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<Patient, Patient, QAfterWhereClause> monthOfBirthBetween(
    int? lowerMonthOfBirth,
    int? upperMonthOfBirth, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'monthOfBirth',
        lower: [lowerMonthOfBirth],
        includeLower: includeLower,
        upper: [upperMonthOfBirth],
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Patient, Patient, QAfterWhereClause> dayOfBirthIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'dayOfBirth',
        value: [null],
      ));
    });
  }

  QueryBuilder<Patient, Patient, QAfterWhereClause> dayOfBirthIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'dayOfBirth',
        lower: [null],
        includeLower: false,
        upper: [],
      ));
    });
  }

  QueryBuilder<Patient, Patient, QAfterWhereClause> dayOfBirthEqualTo(
      int? dayOfBirth) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'dayOfBirth',
        value: [dayOfBirth],
      ));
    });
  }

  QueryBuilder<Patient, Patient, QAfterWhereClause> dayOfBirthNotEqualTo(
      int? dayOfBirth) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'dayOfBirth',
              lower: [],
              upper: [dayOfBirth],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'dayOfBirth',
              lower: [dayOfBirth],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'dayOfBirth',
              lower: [dayOfBirth],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'dayOfBirth',
              lower: [],
              upper: [dayOfBirth],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<Patient, Patient, QAfterWhereClause> dayOfBirthGreaterThan(
    int? dayOfBirth, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'dayOfBirth',
        lower: [dayOfBirth],
        includeLower: include,
        upper: [],
      ));
    });
  }

  QueryBuilder<Patient, Patient, QAfterWhereClause> dayOfBirthLessThan(
    int? dayOfBirth, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'dayOfBirth',
        lower: [],
        upper: [dayOfBirth],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<Patient, Patient, QAfterWhereClause> dayOfBirthBetween(
    int? lowerDayOfBirth,
    int? upperDayOfBirth, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'dayOfBirth',
        lower: [lowerDayOfBirth],
        includeLower: includeLower,
        upper: [upperDayOfBirth],
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Patient, Patient, QAfterWhereClause> activitiesIdElementEqualTo(
      int activitiesIdElement) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'activitiesId',
        value: [activitiesIdElement],
      ));
    });
  }

  QueryBuilder<Patient, Patient, QAfterWhereClause>
      activitiesIdElementNotEqualTo(int activitiesIdElement) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'activitiesId',
              lower: [],
              upper: [activitiesIdElement],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'activitiesId',
              lower: [activitiesIdElement],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'activitiesId',
              lower: [activitiesIdElement],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'activitiesId',
              lower: [],
              upper: [activitiesIdElement],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<Patient, Patient, QAfterWhereClause>
      activitiesIdElementGreaterThan(
    int activitiesIdElement, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'activitiesId',
        lower: [activitiesIdElement],
        includeLower: include,
        upper: [],
      ));
    });
  }

  QueryBuilder<Patient, Patient, QAfterWhereClause> activitiesIdElementLessThan(
    int activitiesIdElement, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'activitiesId',
        lower: [],
        upper: [activitiesIdElement],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<Patient, Patient, QAfterWhereClause> activitiesIdElementBetween(
    int lowerActivitiesIdElement,
    int upperActivitiesIdElement, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'activitiesId',
        lower: [lowerActivitiesIdElement],
        includeLower: includeLower,
        upper: [upperActivitiesIdElement],
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Patient, Patient, QAfterWhereClause> createdAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'createdAt',
        value: [null],
      ));
    });
  }

  QueryBuilder<Patient, Patient, QAfterWhereClause> createdAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'createdAt',
        lower: [null],
        includeLower: false,
        upper: [],
      ));
    });
  }

  QueryBuilder<Patient, Patient, QAfterWhereClause> createdAtEqualTo(
      DateTime? createdAt) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'createdAt',
        value: [createdAt],
      ));
    });
  }

  QueryBuilder<Patient, Patient, QAfterWhereClause> createdAtNotEqualTo(
      DateTime? createdAt) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'createdAt',
              lower: [],
              upper: [createdAt],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'createdAt',
              lower: [createdAt],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'createdAt',
              lower: [createdAt],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'createdAt',
              lower: [],
              upper: [createdAt],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<Patient, Patient, QAfterWhereClause> createdAtGreaterThan(
    DateTime? createdAt, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'createdAt',
        lower: [createdAt],
        includeLower: include,
        upper: [],
      ));
    });
  }

  QueryBuilder<Patient, Patient, QAfterWhereClause> createdAtLessThan(
    DateTime? createdAt, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'createdAt',
        lower: [],
        upper: [createdAt],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<Patient, Patient, QAfterWhereClause> createdAtBetween(
    DateTime? lowerCreatedAt,
    DateTime? upperCreatedAt, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'createdAt',
        lower: [lowerCreatedAt],
        includeLower: includeLower,
        upper: [upperCreatedAt],
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Patient, Patient, QAfterWhereClause> updatedAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'updatedAt',
        value: [null],
      ));
    });
  }

  QueryBuilder<Patient, Patient, QAfterWhereClause> updatedAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'updatedAt',
        lower: [null],
        includeLower: false,
        upper: [],
      ));
    });
  }

  QueryBuilder<Patient, Patient, QAfterWhereClause> updatedAtEqualTo(
      DateTime? updatedAt) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'updatedAt',
        value: [updatedAt],
      ));
    });
  }

  QueryBuilder<Patient, Patient, QAfterWhereClause> updatedAtNotEqualTo(
      DateTime? updatedAt) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'updatedAt',
              lower: [],
              upper: [updatedAt],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'updatedAt',
              lower: [updatedAt],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'updatedAt',
              lower: [updatedAt],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'updatedAt',
              lower: [],
              upper: [updatedAt],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<Patient, Patient, QAfterWhereClause> updatedAtGreaterThan(
    DateTime? updatedAt, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'updatedAt',
        lower: [updatedAt],
        includeLower: include,
        upper: [],
      ));
    });
  }

  QueryBuilder<Patient, Patient, QAfterWhereClause> updatedAtLessThan(
    DateTime? updatedAt, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'updatedAt',
        lower: [],
        upper: [updatedAt],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<Patient, Patient, QAfterWhereClause> updatedAtBetween(
    DateTime? lowerUpdatedAt,
    DateTime? upperUpdatedAt, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'updatedAt',
        lower: [lowerUpdatedAt],
        includeLower: includeLower,
        upper: [upperUpdatedAt],
        includeUpper: includeUpper,
      ));
    });
  }
}

extension PatientQueryFilter
    on QueryBuilder<Patient, Patient, QFilterCondition> {
  QueryBuilder<Patient, Patient, QAfterFilterCondition> activitiesIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'activitiesId',
      ));
    });
  }

  QueryBuilder<Patient, Patient, QAfterFilterCondition>
      activitiesIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'activitiesId',
      ));
    });
  }

  QueryBuilder<Patient, Patient, QAfterFilterCondition>
      activitiesIdElementEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'activitiesId',
        value: value,
      ));
    });
  }

  QueryBuilder<Patient, Patient, QAfterFilterCondition>
      activitiesIdElementGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'activitiesId',
        value: value,
      ));
    });
  }

  QueryBuilder<Patient, Patient, QAfterFilterCondition>
      activitiesIdElementLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'activitiesId',
        value: value,
      ));
    });
  }

  QueryBuilder<Patient, Patient, QAfterFilterCondition>
      activitiesIdElementBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'activitiesId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Patient, Patient, QAfterFilterCondition>
      activitiesIdLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'activitiesId',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<Patient, Patient, QAfterFilterCondition> activitiesIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'activitiesId',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<Patient, Patient, QAfterFilterCondition>
      activitiesIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'activitiesId',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Patient, Patient, QAfterFilterCondition>
      activitiesIdLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'activitiesId',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<Patient, Patient, QAfterFilterCondition>
      activitiesIdLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'activitiesId',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Patient, Patient, QAfterFilterCondition>
      activitiesIdLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'activitiesId',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<Patient, Patient, QAfterFilterCondition> cpfIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'cpf',
      ));
    });
  }

  QueryBuilder<Patient, Patient, QAfterFilterCondition> cpfIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'cpf',
      ));
    });
  }

  QueryBuilder<Patient, Patient, QAfterFilterCondition> cpfEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'cpf',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Patient, Patient, QAfterFilterCondition> cpfGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'cpf',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Patient, Patient, QAfterFilterCondition> cpfLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'cpf',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Patient, Patient, QAfterFilterCondition> cpfBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'cpf',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Patient, Patient, QAfterFilterCondition> cpfStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'cpf',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Patient, Patient, QAfterFilterCondition> cpfEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'cpf',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Patient, Patient, QAfterFilterCondition> cpfContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'cpf',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Patient, Patient, QAfterFilterCondition> cpfMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'cpf',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Patient, Patient, QAfterFilterCondition> cpfIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'cpf',
        value: '',
      ));
    });
  }

  QueryBuilder<Patient, Patient, QAfterFilterCondition> cpfIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'cpf',
        value: '',
      ));
    });
  }

  QueryBuilder<Patient, Patient, QAfterFilterCondition> createdAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'createdAt',
      ));
    });
  }

  QueryBuilder<Patient, Patient, QAfterFilterCondition> createdAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'createdAt',
      ));
    });
  }

  QueryBuilder<Patient, Patient, QAfterFilterCondition> createdAtEqualTo(
      DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'createdAt',
        value: value,
      ));
    });
  }

  QueryBuilder<Patient, Patient, QAfterFilterCondition> createdAtGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'createdAt',
        value: value,
      ));
    });
  }

  QueryBuilder<Patient, Patient, QAfterFilterCondition> createdAtLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'createdAt',
        value: value,
      ));
    });
  }

  QueryBuilder<Patient, Patient, QAfterFilterCondition> createdAtBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'createdAt',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Patient, Patient, QAfterFilterCondition> dayOfBirthIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'dayOfBirth',
      ));
    });
  }

  QueryBuilder<Patient, Patient, QAfterFilterCondition> dayOfBirthIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'dayOfBirth',
      ));
    });
  }

  QueryBuilder<Patient, Patient, QAfterFilterCondition> dayOfBirthEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'dayOfBirth',
        value: value,
      ));
    });
  }

  QueryBuilder<Patient, Patient, QAfterFilterCondition> dayOfBirthGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'dayOfBirth',
        value: value,
      ));
    });
  }

  QueryBuilder<Patient, Patient, QAfterFilterCondition> dayOfBirthLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'dayOfBirth',
        value: value,
      ));
    });
  }

  QueryBuilder<Patient, Patient, QAfterFilterCondition> dayOfBirthBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'dayOfBirth',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Patient, Patient, QAfterFilterCondition> hasPictureIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'hasPicture',
      ));
    });
  }

  QueryBuilder<Patient, Patient, QAfterFilterCondition> hasPictureIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'hasPicture',
      ));
    });
  }

  QueryBuilder<Patient, Patient, QAfterFilterCondition> hasPictureEqualTo(
      bool? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'hasPicture',
        value: value,
      ));
    });
  }

  QueryBuilder<Patient, Patient, QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Patient, Patient, QAfterFilterCondition> idGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Patient, Patient, QAfterFilterCondition> idLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Patient, Patient, QAfterFilterCondition> idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Patient, Patient, QAfterFilterCondition> monthOfBirthIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'monthOfBirth',
      ));
    });
  }

  QueryBuilder<Patient, Patient, QAfterFilterCondition>
      monthOfBirthIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'monthOfBirth',
      ));
    });
  }

  QueryBuilder<Patient, Patient, QAfterFilterCondition> monthOfBirthEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'monthOfBirth',
        value: value,
      ));
    });
  }

  QueryBuilder<Patient, Patient, QAfterFilterCondition> monthOfBirthGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'monthOfBirth',
        value: value,
      ));
    });
  }

  QueryBuilder<Patient, Patient, QAfterFilterCondition> monthOfBirthLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'monthOfBirth',
        value: value,
      ));
    });
  }

  QueryBuilder<Patient, Patient, QAfterFilterCondition> monthOfBirthBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'monthOfBirth',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Patient, Patient, QAfterFilterCondition> motherNameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'motherName',
      ));
    });
  }

  QueryBuilder<Patient, Patient, QAfterFilterCondition> motherNameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'motherName',
      ));
    });
  }

  QueryBuilder<Patient, Patient, QAfterFilterCondition> motherNameEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'motherName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Patient, Patient, QAfterFilterCondition> motherNameGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'motherName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Patient, Patient, QAfterFilterCondition> motherNameLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'motherName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Patient, Patient, QAfterFilterCondition> motherNameBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'motherName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Patient, Patient, QAfterFilterCondition> motherNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'motherName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Patient, Patient, QAfterFilterCondition> motherNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'motherName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Patient, Patient, QAfterFilterCondition> motherNameContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'motherName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Patient, Patient, QAfterFilterCondition> motherNameMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'motherName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Patient, Patient, QAfterFilterCondition> motherNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'motherName',
        value: '',
      ));
    });
  }

  QueryBuilder<Patient, Patient, QAfterFilterCondition> motherNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'motherName',
        value: '',
      ));
    });
  }

  QueryBuilder<Patient, Patient, QAfterFilterCondition> nameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'name',
      ));
    });
  }

  QueryBuilder<Patient, Patient, QAfterFilterCondition> nameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'name',
      ));
    });
  }

  QueryBuilder<Patient, Patient, QAfterFilterCondition> nameEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Patient, Patient, QAfterFilterCondition> nameGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Patient, Patient, QAfterFilterCondition> nameLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Patient, Patient, QAfterFilterCondition> nameBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'name',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Patient, Patient, QAfterFilterCondition> nameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Patient, Patient, QAfterFilterCondition> nameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Patient, Patient, QAfterFilterCondition> nameContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Patient, Patient, QAfterFilterCondition> nameMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'name',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Patient, Patient, QAfterFilterCondition> nameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<Patient, Patient, QAfterFilterCondition> nameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<Patient, Patient, QAfterFilterCondition> observationIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'observation',
      ));
    });
  }

  QueryBuilder<Patient, Patient, QAfterFilterCondition> observationIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'observation',
      ));
    });
  }

  QueryBuilder<Patient, Patient, QAfterFilterCondition> observationEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'observation',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Patient, Patient, QAfterFilterCondition> observationGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'observation',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Patient, Patient, QAfterFilterCondition> observationLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'observation',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Patient, Patient, QAfterFilterCondition> observationBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'observation',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Patient, Patient, QAfterFilterCondition> observationStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'observation',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Patient, Patient, QAfterFilterCondition> observationEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'observation',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Patient, Patient, QAfterFilterCondition> observationContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'observation',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Patient, Patient, QAfterFilterCondition> observationMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'observation',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Patient, Patient, QAfterFilterCondition> observationIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'observation',
        value: '',
      ));
    });
  }

  QueryBuilder<Patient, Patient, QAfterFilterCondition>
      observationIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'observation',
        value: '',
      ));
    });
  }

  QueryBuilder<Patient, Patient, QAfterFilterCondition> phonesIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'phones',
      ));
    });
  }

  QueryBuilder<Patient, Patient, QAfterFilterCondition> phonesIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'phones',
      ));
    });
  }

  QueryBuilder<Patient, Patient, QAfterFilterCondition> phonesElementEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'phones',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Patient, Patient, QAfterFilterCondition>
      phonesElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'phones',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Patient, Patient, QAfterFilterCondition> phonesElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'phones',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Patient, Patient, QAfterFilterCondition> phonesElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'phones',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Patient, Patient, QAfterFilterCondition> phonesElementStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'phones',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Patient, Patient, QAfterFilterCondition> phonesElementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'phones',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Patient, Patient, QAfterFilterCondition> phonesElementContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'phones',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Patient, Patient, QAfterFilterCondition> phonesElementMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'phones',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Patient, Patient, QAfterFilterCondition> phonesElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'phones',
        value: '',
      ));
    });
  }

  QueryBuilder<Patient, Patient, QAfterFilterCondition>
      phonesElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'phones',
        value: '',
      ));
    });
  }

  QueryBuilder<Patient, Patient, QAfterFilterCondition> phonesLengthEqualTo(
      int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'phones',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<Patient, Patient, QAfterFilterCondition> phonesIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'phones',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<Patient, Patient, QAfterFilterCondition> phonesIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'phones',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Patient, Patient, QAfterFilterCondition> phonesLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'phones',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<Patient, Patient, QAfterFilterCondition> phonesLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'phones',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Patient, Patient, QAfterFilterCondition> phonesLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'phones',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<Patient, Patient, QAfterFilterCondition> remoteIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'remoteId',
      ));
    });
  }

  QueryBuilder<Patient, Patient, QAfterFilterCondition> remoteIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'remoteId',
      ));
    });
  }

  QueryBuilder<Patient, Patient, QAfterFilterCondition> remoteIdEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'remoteId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Patient, Patient, QAfterFilterCondition> remoteIdGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'remoteId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Patient, Patient, QAfterFilterCondition> remoteIdLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'remoteId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Patient, Patient, QAfterFilterCondition> remoteIdBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'remoteId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Patient, Patient, QAfterFilterCondition> remoteIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'remoteId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Patient, Patient, QAfterFilterCondition> remoteIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'remoteId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Patient, Patient, QAfterFilterCondition> remoteIdContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'remoteId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Patient, Patient, QAfterFilterCondition> remoteIdMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'remoteId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Patient, Patient, QAfterFilterCondition> remoteIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'remoteId',
        value: '',
      ));
    });
  }

  QueryBuilder<Patient, Patient, QAfterFilterCondition> remoteIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'remoteId',
        value: '',
      ));
    });
  }

  QueryBuilder<Patient, Patient, QAfterFilterCondition> updatedAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'updatedAt',
      ));
    });
  }

  QueryBuilder<Patient, Patient, QAfterFilterCondition> updatedAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'updatedAt',
      ));
    });
  }

  QueryBuilder<Patient, Patient, QAfterFilterCondition> updatedAtEqualTo(
      DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'updatedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<Patient, Patient, QAfterFilterCondition> updatedAtGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'updatedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<Patient, Patient, QAfterFilterCondition> updatedAtLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'updatedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<Patient, Patient, QAfterFilterCondition> updatedAtBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'updatedAt',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Patient, Patient, QAfterFilterCondition> yearOfBirthIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'yearOfBirth',
      ));
    });
  }

  QueryBuilder<Patient, Patient, QAfterFilterCondition> yearOfBirthIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'yearOfBirth',
      ));
    });
  }

  QueryBuilder<Patient, Patient, QAfterFilterCondition> yearOfBirthEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'yearOfBirth',
        value: value,
      ));
    });
  }

  QueryBuilder<Patient, Patient, QAfterFilterCondition> yearOfBirthGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'yearOfBirth',
        value: value,
      ));
    });
  }

  QueryBuilder<Patient, Patient, QAfterFilterCondition> yearOfBirthLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'yearOfBirth',
        value: value,
      ));
    });
  }

  QueryBuilder<Patient, Patient, QAfterFilterCondition> yearOfBirthBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'yearOfBirth',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension PatientQueryObject
    on QueryBuilder<Patient, Patient, QFilterCondition> {}

extension PatientQueryLinks
    on QueryBuilder<Patient, Patient, QFilterCondition> {
  QueryBuilder<Patient, Patient, QAfterFilterCondition> address(
      FilterQuery<Address> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'address');
    });
  }

  QueryBuilder<Patient, Patient, QAfterFilterCondition> addressIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'address', 0, true, 0, true);
    });
  }
}

extension PatientQuerySortBy on QueryBuilder<Patient, Patient, QSortBy> {
  QueryBuilder<Patient, Patient, QAfterSortBy> sortByCpf() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cpf', Sort.asc);
    });
  }

  QueryBuilder<Patient, Patient, QAfterSortBy> sortByCpfDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cpf', Sort.desc);
    });
  }

  QueryBuilder<Patient, Patient, QAfterSortBy> sortByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<Patient, Patient, QAfterSortBy> sortByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<Patient, Patient, QAfterSortBy> sortByDayOfBirth() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dayOfBirth', Sort.asc);
    });
  }

  QueryBuilder<Patient, Patient, QAfterSortBy> sortByDayOfBirthDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dayOfBirth', Sort.desc);
    });
  }

  QueryBuilder<Patient, Patient, QAfterSortBy> sortByHasPicture() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hasPicture', Sort.asc);
    });
  }

  QueryBuilder<Patient, Patient, QAfterSortBy> sortByHasPictureDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hasPicture', Sort.desc);
    });
  }

  QueryBuilder<Patient, Patient, QAfterSortBy> sortByMonthOfBirth() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'monthOfBirth', Sort.asc);
    });
  }

  QueryBuilder<Patient, Patient, QAfterSortBy> sortByMonthOfBirthDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'monthOfBirth', Sort.desc);
    });
  }

  QueryBuilder<Patient, Patient, QAfterSortBy> sortByMotherName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'motherName', Sort.asc);
    });
  }

  QueryBuilder<Patient, Patient, QAfterSortBy> sortByMotherNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'motherName', Sort.desc);
    });
  }

  QueryBuilder<Patient, Patient, QAfterSortBy> sortByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<Patient, Patient, QAfterSortBy> sortByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<Patient, Patient, QAfterSortBy> sortByObservation() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'observation', Sort.asc);
    });
  }

  QueryBuilder<Patient, Patient, QAfterSortBy> sortByObservationDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'observation', Sort.desc);
    });
  }

  QueryBuilder<Patient, Patient, QAfterSortBy> sortByRemoteId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'remoteId', Sort.asc);
    });
  }

  QueryBuilder<Patient, Patient, QAfterSortBy> sortByRemoteIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'remoteId', Sort.desc);
    });
  }

  QueryBuilder<Patient, Patient, QAfterSortBy> sortByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<Patient, Patient, QAfterSortBy> sortByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }

  QueryBuilder<Patient, Patient, QAfterSortBy> sortByYearOfBirth() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'yearOfBirth', Sort.asc);
    });
  }

  QueryBuilder<Patient, Patient, QAfterSortBy> sortByYearOfBirthDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'yearOfBirth', Sort.desc);
    });
  }
}

extension PatientQuerySortThenBy
    on QueryBuilder<Patient, Patient, QSortThenBy> {
  QueryBuilder<Patient, Patient, QAfterSortBy> thenByCpf() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cpf', Sort.asc);
    });
  }

  QueryBuilder<Patient, Patient, QAfterSortBy> thenByCpfDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cpf', Sort.desc);
    });
  }

  QueryBuilder<Patient, Patient, QAfterSortBy> thenByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<Patient, Patient, QAfterSortBy> thenByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<Patient, Patient, QAfterSortBy> thenByDayOfBirth() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dayOfBirth', Sort.asc);
    });
  }

  QueryBuilder<Patient, Patient, QAfterSortBy> thenByDayOfBirthDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dayOfBirth', Sort.desc);
    });
  }

  QueryBuilder<Patient, Patient, QAfterSortBy> thenByHasPicture() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hasPicture', Sort.asc);
    });
  }

  QueryBuilder<Patient, Patient, QAfterSortBy> thenByHasPictureDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hasPicture', Sort.desc);
    });
  }

  QueryBuilder<Patient, Patient, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<Patient, Patient, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<Patient, Patient, QAfterSortBy> thenByMonthOfBirth() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'monthOfBirth', Sort.asc);
    });
  }

  QueryBuilder<Patient, Patient, QAfterSortBy> thenByMonthOfBirthDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'monthOfBirth', Sort.desc);
    });
  }

  QueryBuilder<Patient, Patient, QAfterSortBy> thenByMotherName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'motherName', Sort.asc);
    });
  }

  QueryBuilder<Patient, Patient, QAfterSortBy> thenByMotherNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'motherName', Sort.desc);
    });
  }

  QueryBuilder<Patient, Patient, QAfterSortBy> thenByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<Patient, Patient, QAfterSortBy> thenByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<Patient, Patient, QAfterSortBy> thenByObservation() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'observation', Sort.asc);
    });
  }

  QueryBuilder<Patient, Patient, QAfterSortBy> thenByObservationDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'observation', Sort.desc);
    });
  }

  QueryBuilder<Patient, Patient, QAfterSortBy> thenByRemoteId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'remoteId', Sort.asc);
    });
  }

  QueryBuilder<Patient, Patient, QAfterSortBy> thenByRemoteIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'remoteId', Sort.desc);
    });
  }

  QueryBuilder<Patient, Patient, QAfterSortBy> thenByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<Patient, Patient, QAfterSortBy> thenByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }

  QueryBuilder<Patient, Patient, QAfterSortBy> thenByYearOfBirth() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'yearOfBirth', Sort.asc);
    });
  }

  QueryBuilder<Patient, Patient, QAfterSortBy> thenByYearOfBirthDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'yearOfBirth', Sort.desc);
    });
  }
}

extension PatientQueryWhereDistinct
    on QueryBuilder<Patient, Patient, QDistinct> {
  QueryBuilder<Patient, Patient, QDistinct> distinctByActivitiesId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'activitiesId');
    });
  }

  QueryBuilder<Patient, Patient, QDistinct> distinctByCpf(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'cpf', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Patient, Patient, QDistinct> distinctByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'createdAt');
    });
  }

  QueryBuilder<Patient, Patient, QDistinct> distinctByDayOfBirth() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'dayOfBirth');
    });
  }

  QueryBuilder<Patient, Patient, QDistinct> distinctByHasPicture() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'hasPicture');
    });
  }

  QueryBuilder<Patient, Patient, QDistinct> distinctByMonthOfBirth() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'monthOfBirth');
    });
  }

  QueryBuilder<Patient, Patient, QDistinct> distinctByMotherName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'motherName', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Patient, Patient, QDistinct> distinctByName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'name', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Patient, Patient, QDistinct> distinctByObservation(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'observation', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Patient, Patient, QDistinct> distinctByPhones() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'phones');
    });
  }

  QueryBuilder<Patient, Patient, QDistinct> distinctByRemoteId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'remoteId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Patient, Patient, QDistinct> distinctByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'updatedAt');
    });
  }

  QueryBuilder<Patient, Patient, QDistinct> distinctByYearOfBirth() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'yearOfBirth');
    });
  }
}

extension PatientQueryProperty
    on QueryBuilder<Patient, Patient, QQueryProperty> {
  QueryBuilder<Patient, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<Patient, List<int>?, QQueryOperations> activitiesIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'activitiesId');
    });
  }

  QueryBuilder<Patient, String?, QQueryOperations> cpfProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'cpf');
    });
  }

  QueryBuilder<Patient, DateTime?, QQueryOperations> createdAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'createdAt');
    });
  }

  QueryBuilder<Patient, int?, QQueryOperations> dayOfBirthProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'dayOfBirth');
    });
  }

  QueryBuilder<Patient, bool?, QQueryOperations> hasPictureProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'hasPicture');
    });
  }

  QueryBuilder<Patient, int?, QQueryOperations> monthOfBirthProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'monthOfBirth');
    });
  }

  QueryBuilder<Patient, String?, QQueryOperations> motherNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'motherName');
    });
  }

  QueryBuilder<Patient, String?, QQueryOperations> nameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'name');
    });
  }

  QueryBuilder<Patient, String?, QQueryOperations> observationProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'observation');
    });
  }

  QueryBuilder<Patient, List<String>?, QQueryOperations> phonesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'phones');
    });
  }

  QueryBuilder<Patient, String?, QQueryOperations> remoteIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'remoteId');
    });
  }

  QueryBuilder<Patient, DateTime?, QQueryOperations> updatedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'updatedAt');
    });
  }

  QueryBuilder<Patient, int?, QQueryOperations> yearOfBirthProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'yearOfBirth');
    });
  }
}
