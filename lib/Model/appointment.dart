import 'package:flutter/cupertino.dart';

class Appointment {
  final String id;
  final String mode;
  final DateTime time;
  final DateTime bookedTime;
  final String doctorId;
  final String patientId;

  Appointment({
    @required this.id,
    @required this.mode,
    @required this.time,
    @required this.bookedTime,
    @required this.doctorId,
    @required this.patientId,
  });
}
