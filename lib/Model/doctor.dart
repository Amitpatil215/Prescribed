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
  final AvailabilityTime teleMedication;
  final AvailabilityTime physicalConsultation;

  Doctor({
    @required this.id,
    @required this.name,
    @required this.image,
    @required this.moreDetails,
    @required this.field,
    @required this.language,
    @required this.degree,
    @required this.phone,
    @required this.email,
    @required this.clinicName,
    @required this.location,
    @required this.experience,
    @required this.rating,
    @required this.varificationBadge,
    @required this.teleMedication,
    @required this.physicalConsultation,
  });
}
