import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import '../Model/patient.dart';

class PatientProfileProvider with ChangeNotifier {
  Patient fetchedPatient;

  Stream<Patient> patientData() {
    try {
      var userId = FirebaseAuth.instance.currentUser.uid;
      return FirebaseFirestore.instance
          .collection("user")
          .doc(userId)
          .snapshots()
          .map(
            (event) => Patient(
              name: event.data()['name'] ?? "Your Name ",
              phone: event.data()['phone'] ?? "+91 123...",
              email: event.data()['email'] ?? "Your Email address",
              gender: Gender.values.elementAt(event.data()['gender']) ?? 1,
              location: GeoLocation(
                longitude: null,
                latitude: null,
                address: event.data()['location'],
              ),
            ),
          );
    } catch (error) {
      print(error);
    }
  }

  Patient get fetchedPatientDetails {
    return fetchedPatient;
  }
}
