import 'dart:io';

import 'package:flutter/foundation.dart';

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
  final String name;
  final File image;
  final String moreDetails;
  final String field;
  final String language;
  final String degree;
  final int phone;
  final String email;
  final String clinicName;
  final GeoLocation location;
  final DateTime experience;
  final int rating;
  final bool varificationBadge;
  final AvailabilityMode availabilityMode;
  final AvailabilityTime teleMedication;
  final AvailabilityTime physicalConsultation;

  Doctor({
    this.id,
    this.name,
    this.image,
    this.moreDetails,
    this.field,
    this.language,
    this.degree,
    this.phone,
    this.email,
    this.clinicName,
    this.location,
    this.experience,
    this.rating,
    this.varificationBadge,
    this.availabilityMode,
    this.teleMedication,
    this.physicalConsultation,
  });
}
