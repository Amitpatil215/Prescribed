import 'package:flutter/foundation.dart';

enum Gender {
  Male,
  Female,
  Other,
}

class GeoLocation {
  final int longitude;
  final int latitude;
  String address;

  GeoLocation({
    @required this.longitude,
    @required this.latitude,
    @required this.address,
  });
}

class Patient {
  final String id;
  String name;
  Gender gender;
  final DateTime dateOfBirth;
  int phone;
  String email;
  final GeoLocation location;
  final String orgId;
  final double weight;
  final double bloodPressure;
  final double bloodSugar;
  final double height;
  final String allergy;

  Patient({
    this.id,
    this.name,
    this.gender,
    this.dateOfBirth,
    this.phone,
    this.email,
    this.location,
    this.orgId,
    this.weight,
    this.bloodPressure,
    this.bloodSugar,
    this.height,
    this.allergy,
  });
}
