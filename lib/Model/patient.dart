import 'package:flutter/foundation.dart';

enum Gender {
  Male,
  Female,
}

class GeoLocation {
  final int longitude;
  final int latitude;
  final String address;

  GeoLocation({
    @required this.longitude,
    @required this.latitude,
    @required this.address,
  });
}

class Patient {
  final String id;
  final String name;
  final Gender gender;
  final DateTime dateOfBirth;
  final int phone;
  final String email;
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
