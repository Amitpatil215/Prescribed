import 'dart:io';


import 'package:flutter/foundation.dart';

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

enum AvailabilityMode {
  TeleMedication,
  PhysicalConsultation,
}

class AvailabilityTime {
  final DateTime from;
  final DateTime till;

  AvailabilityTime({
    @required this.from,
    @required this.till,
  });
}

class Doctor {
  final String id;
  String name;
  final File image;
  String moreDetails;
  String field;
  String language;
  String degree;
  String university;
  int phone;
  String email;
  final String clinicName;
  GeoLocation location;
  int experience;
  final int rating;
  final bool varificationBadge;
  DateTime tfrom;
  DateTime tto;
  DateTime cfrom;
  DateTime cto;
  final AvailabilityMode availabilityMode;

  Doctor({
    this.id,
    this.name,
    this.image,
    this.moreDetails,
    this.field,
    this.language,
    this.degree,
    this.university,
    this.phone,
    this.email,
    this.clinicName,
    this.location,
    this.experience,
    this.rating,
    this.varificationBadge,
    this.availabilityMode,
    this.tfrom,
    this.tto,
    this.cto,
    this.cfrom,
  });
}
