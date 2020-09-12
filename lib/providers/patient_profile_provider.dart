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

  Future<void> saveEditedUser(Patient editedUser) async {
    try {
      var userId = FirebaseAuth.instance.currentUser.uid;
      await FirebaseFirestore.instance.collection("user").doc(userId).set({
        "name": editedUser.name,
        "gender": editedUser.gender.index,
        "location": editedUser.location.address,
        "phone": editedUser.phone,
        "email": editedUser.email,
      });
    } catch (error) {
      print("Error in storing profile edit page with $error");
    }
    notifyListeners();
  }

  Patient get fetchedPatientDetails {
    return fetchedPatient;
  }
}
