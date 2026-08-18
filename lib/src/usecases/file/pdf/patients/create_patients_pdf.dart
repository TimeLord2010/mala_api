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
  required Iterable<Patient> patients,
}) async {
  var doc = Document(
    theme: ThemeData(defaultTextStyle: TextStyle(font: Font.helvetica())),
  );
  var page = _createPage(patients);
  print('Created patient pdfs pages');
  doc.addPage(page);
  print("saving pdf to fetch bytes");
  var bytes = await doc.save(enableEventLoopBalancing: true);
  print('Bytes generated');
  return bytes;
}

Page _createPage(Iterable<Patient> patients) {
  var page = MultiPage(
    pageFormat: PdfPageFormat.a4,
    margin: const EdgeInsets.all(_margin),
    build: (context) {
      return [
        Text(
          'Listagem de pacientes',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        _createHorizontalLine(),
        SizedBox(height: 10),
        for (var patient in patients) ..._createPatient(patient),
      ];
    },
  );
  return page;
}

/// The patient is returned as separate top level widgets so [MultiPage] is able
/// to break between them.
///
/// Wrapping everything in a single [Column] makes a patient taller than a page
/// loop forever: [Column] is a spanning widget that always reports it still has
/// widgets to render, so [MultiPage] keeps creating pages waiting for it to
/// finish. The observation is the only field with an unbounded height, hence it
/// is rendered on its own.
List<Widget> _createPatient(Patient patient) {
  var observation = _sanitize(patient.observation)?.trim();
  return [
    _createFields(patient),
    if (observation != null && observation.isNotEmpty) ...[
      SizedBox(height: 5),
      _createObservation(observation),
    ],
    SizedBox(height: 5),
    _createHorizontalLine(),
  ];
}

/// [TextOverflow.span] allows a long observation to flow into the next page
/// instead of requiring a page taller than the format.
Widget _createObservation(String observation) {
  return RichText(
    overflow: TextOverflow.span,
    text: TextSpan(
      children: [
        TextSpan(
          text: 'Obs.: ',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        TextSpan(text: observation),
      ],
    ),
  );
}

Widget _createFields(Patient patient) {
  var address = patient.address;
  return Column(
    children: <Widget>[
      _createRow(
        children: [
          _createField(title: 'Nome', value: patient.name),
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
          _createField(title: 'CEP', value: address?.zipCode),
          _createField(title: 'Bairro', value: address?.district),
        ],
      ),
      _createRow(
        children: [
          _createField(
            title: 'Endereço',
            value: address?.street,
            valueMaxLines: 4,
          ),
          _createField(title: 'Número', value: address?.number),
          _createField(title: 'Comp.', value: address?.complement),
        ],
        getFlex: (index) => index == 0 ? 2 : 1,
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
            child: Text(
              '$title: ',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        ),
      Expanded(
        child: Text(
          _sanitize(value) ?? ' ',
          maxLines: valueMaxLines,
          overflow: TextOverflow.clip,
        ),
      ),
    ],
  );
}

/// The built in Helvetica only covers Latin-1, so any character outside of it
/// is drawn as a placeholder. Replaces the ones found in patient data by their
/// ascii counterpart.
String? _sanitize(String? value) {
  if (value == null) return null;
  return value
      .replaceAll('\u2013', '-')
      .replaceAll('\u2014', '-')
      .replaceAll('\u2018', "'")
      .replaceAll('\u2019', "'")
      .replaceAll('\u201c', '"')
      .replaceAll('\u201d', '"')
      .replaceAll('\u2026', '...');
}

Container _createHorizontalLine() {
  return Container(
    width: _contentWidth,
    height: 2,
    color: const PdfColor.fromInt(0x00000000),
    margin: const EdgeInsets.symmetric(vertical: 2),
  );
}
