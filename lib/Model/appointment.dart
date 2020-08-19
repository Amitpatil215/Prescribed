import 'package:flutter/cupertino.dart';

enum Mode {
  TeleMedication,
  PhysicalConsultation,
}

class Appointment {
  final String id;
  final Mode mode;
  final DateTime time;
  final String doctorId;
  final String patientId;

  Appointment({
    @required this.id,
    @required this.mode,
    @required this.time,
    @required this.doctorId,
    @required this.patientId,
  });
}
