import 'dart:html';

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
  final Geolocation location;
  final String orgId;
  final double weight;
  final double bloodPressure;
  final double bloodSugar;
  final double height;
  final String allergy;

  Patient({
    @required this.id,
    @required this.name,
    @required this.gender,
    @required this.dateOfBirth,
    @required this.phone,
    @required this.email,
    @required this.location,
    this.orgId,
    this.weight,
    this.bloodPressure,
    this.bloodSugar,
    this.height,
    this.allergy,
  });
}
