import 'package:flutter/cupertino.dart';

class Appointment {
  final String appointmentId;
  final String mode;
  final DateTime time;
  final String doctorId;
  final String patientId;

  Appointment({
    @required this.appointmentId,
    @required this.mode,
    @required this.time,
    @required this.doctorId,
    @required this.patientId,
  });
}
