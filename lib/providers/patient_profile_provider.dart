import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../Model/patient.dart';

class PatientProfileProvider with ChangeNotifier {
  Patient fetchedPatient;

  Stream<Patient> patientData() {
    print("Patient Data Running");
    try {
      var userId = FirebaseAuth.instance.currentUser.uid;
      var snapshot = FirebaseFirestore.instance
          .collection("patient")
          .doc(userId)
          .snapshots();

      return snapshot.map((event) {
        return Patient(
          name: event.data()['name'],
          phone: event.data()['phone'],
          email: event.data()['email'],
          gender: Gender.values.elementAt(event.data()['gender']) ?? 0,
          location: GeoLocation(
            longitude: null,
            latitude: null,
            address: event.data()['location'],
          ),
          bloodSugar: event.data()['bloodSugar'],
          bloodPressure: event.data()['bloodPressure'],
          heartRate: event.data()['heartRate'],
          allergy: event.data()['allergy'],
        );
      });
    } catch (error) {
      print("error in fetching error $error");
    }

    notifyListeners();
  }

  Future<void> createNewUser([Patient editedUser]) async {
    try {
      var userId = FirebaseAuth.instance.currentUser.uid;
      await FirebaseFirestore.instance.collection("patient").doc(userId).set({
        "id": editedUser.id ?? userId,
        "phone": editedUser.phone,
        "name": null,
        "gender": 0,
        "location": null,
        "email": null,
        "bloodSugar": null,
        "bloodPressure": null,
        "heartRate": null,
        "allergy": null,
      });
      await FirebaseFirestore.instance.collection("user").doc(userId).set({
        "isPatient": true,
      });
    } catch (error) {
      print("Error in storing profile edit page with- $error");
    }
    notifyListeners();
    print("Saving to Firestore Done...");
  }

  Future<void> saveEditedUser(Patient editedUser) async {
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
