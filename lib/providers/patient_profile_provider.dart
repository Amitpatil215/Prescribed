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
          .collection("patient")
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
              bloodSugar: event.data()['bloodSugar'],
              bloodPressure: event.data()['bloodPressure'],
              heartRate: event.data()['heartRate'],
              allergy: event.data()['allergy'],
            ),
          );
    } catch (error) {
      print("error in fetching error $error");
    }
  }

  Future<void> createNewUser(Patient editedUser) async {
    try {
      var userId = FirebaseAuth.instance.currentUser.uid;
      await FirebaseFirestore.instance.collection("patient").doc(userId).set({
        "id": editedUser.id ?? " ",
        "phone": editedUser.phone ?? 1234,
        "name": "null",
        "gender": 0,
        "location": "",
        "email": null,
        "bloodSugar": null,
        "bloodPressure": null,
        "heartRate": null,
        "allergy": null,
      });
    } catch (error) {
      print("Error in storing profile edit page with- $error");
    }
    notifyListeners();
    print("Saving to Firestore Done...");
  }

  Future<void> saveEditedUser(Patient editedUser) async {
    print(editedUser.id);
    try {
      var userId = FirebaseAuth.instance.currentUser.uid;
      await FirebaseFirestore.instance.collection("patient").doc(userId).set({
        "name": editedUser.name,
        "gender": editedUser.gender.index,
        "location": editedUser.location.address,
        "phone": editedUser.phone,
        "email": editedUser.email,
        "bloodSugar": editedUser.bloodSugar,
        "bloodPressure": editedUser.bloodPressure,
        "heartRate": editedUser.heartRate,
        "allergy": editedUser.allergy,
      });
    } catch (error) {
      print("Error in storing profile edit page with- $error");
    }
    notifyListeners();
    print("Saving to Firestore Done...");
  }

  Patient get fetchedPatientDetails {
    return fetchedPatient;
  }
}
