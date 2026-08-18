import 'package:mala_api/src/data/entities/patient.dart';
import 'package:mala_api/src/usecases/file/pdf/patients/create_patients_pdf.dart';
import 'package:test/test.dart';

Patient _patient({String? observation, int index = 0}) {
  return Patient(
    name: 'Paciente de Teste Numero $index',
    phones: ['(11) 91234-5678', '(11) 3456-7890'],
    observation: observation,
    dayOfBirth: 1 + (index % 28),
    monthOfBirth: 1 + (index % 12),
    yearOfBirth: 1950 + (index % 60),
  );
}

void main() {
  test('renders a patient whose observation is taller than a page', () async {
    // Shape of the worst observation stored in production: short lines glued by
    // CRLF, enough of them to overflow an A4 page.
    var observation = List.generate(
      80,
      (i) => 'BLUSA OK ATUALIZADO - FOTO OK $i',
    ).join('\r\n');
    var bytes = await createPatientsPdf(
      patients: [_patient(index: 0), _patient(observation: observation, index: 1)],
    );
    expect(bytes.lengthInBytes, greaterThan(0));
  });

  test('renders an observation several pages long', () async {
    var observation = 'Paciente com acompanhamento mensal. ' * 3000;
    var bytes = await createPatientsPdf(
      patients: [_patient(observation: observation)],
    );
    expect(bytes.lengthInBytes, greaterThan(0));
  });

  test('keeps a 2000 patient document small', () async {
    var patients = List.generate(
      2000,
      (i) => _patient(index: i, observation: 'Observacao de rotina $i'),
    );
    var watch = Stopwatch()..start();
    var bytes = await createPatientsPdf(patients: patients);
    watch.stop();
    print('2000 patients: ${bytes.lengthInBytes ~/ 1024}KB in ${watch.elapsedMilliseconds}ms');
    expect(bytes.lengthInBytes, lessThan(5 * 1024 * 1024));
  });
}
