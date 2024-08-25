import 'dart:typed_data';

import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';
import 'package:vit_dart_extensions/vit_dart_extensions.dart';

import '../../../../data/entities/patient.dart';

const double _cm = PdfPageFormat.cm;

const double _totalWidth = 21.0 * _cm;

const double _margin = _cm * 0.5;

const double _contentWidth = _totalWidth - (2 * _margin);

Future<Uint8List> createPatientsPdf({
  required List<Patient> patients,
}) async {
  var doc = Document(
      theme: ThemeData(
    defaultTextStyle: TextStyle(
      font: Font.helvetica(),
    ),
  ));
  var page = _createPage(patients);
  doc.addPage(page);
  var bytes = await doc.save();
  return bytes;
}

Page _createPage(List<Patient> patients) {
  var page = MultiPage(
    pageFormat: PdfPageFormat.a4,
    margin: const EdgeInsets.all(_margin),
    build: (context) {
      return [
        Text('Listagem de pacientes',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            )),
        _createHorizontalLine(),
        SizedBox(height: 10),
        for (var patient in patients) _createPatient(patient),
      ];
    },
  );
  return page;
}

Widget _createPatient(Patient patient) {
  return Column(
    mainAxisSize: MainAxisSize.min,
    crossAxisAlignment: CrossAxisAlignment.stretch,
    children: [
      _createFields(patient),
      SizedBox(height: 5),
      _createHorizontalLine(),
    ],
  );
}

Widget _createFields(Patient patient) {
  var address = patient.address.value;
  return Column(
    children: <Widget>[
      _createRow(
        children: [
          _createField(
            title: 'Nome',
            value: patient.name,
          ),
          _createField(
            title: 'Nasc.',
            value: patient.birthDate?.formatAsReadable(false),
          ),
        ],
        getFlex: (index) => index == 0 ? 2 : 1,
      ),
      _createRow(
        children: [
          _createField(
            title: 'Telefones',
            value: patient.phones?.join(', '),
            valueMaxLines: 2,
          ),
          _createField(
            title: 'CEP',
            value: address?.zipCode,
          ),
          _createField(
            title: 'Bairro',
            value: address?.district,
          ),
        ],
      ),
      _createRow(
        children: [
          _createField(
            title: 'Endereço',
            value: address?.street,
            valueMaxLines: 4,
          ),
          _createField(
            title: 'Número',
            value: address?.number,
          ),
          _createField(
            title: 'Comp.',
            value: address?.complement,
          ),
        ],
        getFlex: (index) => index == 0 ? 2 : 1,
      ),
      _createField(
        title: 'Obs.',
        value: patient.observation,
        valueMaxLines: null,
      ),
    ].separatedBy(SizedBox(height: 5)).toList(),
  );
}

Row _createRow({
  required List<Widget?> children,
  int Function(int index)? getFlex,
}) {
  return Row(
    children: [
      for (var i = 0; i < children.length; i++)
        Flexible(
          flex: getFlex?.call(i) ?? 1,
          child: children.elementAt(i) ?? SizedBox.shrink(),
        ),
    ],
  );
}

Row _createField({
  String? title,
  String? value,
  double fieldSize = 70,
  int? valueMaxLines = 1,
}) {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      if (title != null)
        SizedBox(
          width: fieldSize,
          child: Align(
            alignment: Alignment.topRight,
            child: Text('$title: ',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                )),
          ),
        ),
      Expanded(
        child: Text(
          value ?? ' ',
          maxLines: valueMaxLines,
          overflow: TextOverflow.clip,
        ),
      )
    ],
  );
}

Container _createHorizontalLine() {
  return Container(
      width: _contentWidth,
      height: 2,
      color: const PdfColor.fromInt(0x00000000),
      margin: const EdgeInsets.symmetric(
        vertical: 2,
      ));
}
