enum Activities {
  physicalTherapy,
  waterAerobics,
  pilates,
  psychologist,
  nutrition,
  massageTherapy,
  doctor,
  health,
  others,
  qualivida;

  @override
  String toString() {
    switch (this) {
      case Activities.physicalTherapy:
        return 'Fisioterapia';
      case Activities.waterAerobics:
        return 'Hidroginástica';
      case Activities.pilates:
        return 'Pilates';
      case Activities.psychologist:
        return 'Psicólogo';
      case Activities.nutrition:
        return 'Nutrição';
      case Activities.massageTherapy:
        return 'Massoterapia';
      case Activities.doctor:
        return 'Médico';
      case Activities.health:
        return 'Saúde';
      case Activities.others:
        return 'Outros';
      case Activities.qualivida:
        return 'Qualivida';
    }
  }
}
