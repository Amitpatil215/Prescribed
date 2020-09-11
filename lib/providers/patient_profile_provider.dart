import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:provider/provider.dart';
import '../Model/patient.dart';
import '../providers/auth_user_provider.dart';

class PatientProfileProvider with ChangeNotifier {
  Patient fetchedPatient;

  Stream<Patient> patientData() {
    var userId = FirebaseAuth.instance.currentUser.uid;
    return FirebaseFirestore.instance
        .collection("user")
        .doc(userId)
        .snapshots()
        .map(
          (event) => Patient(
            name: event.data()['name'],
            phone: event.data()['phone'] ?? "1234",
            email: event.data()['email'] ?? "hjv",
          ),
        );
  }

  Future<void> fetchAndSetPatient(BuildContext context) async {
    var userId = Provider.of<AuthUser>(context).userId;
    try {
      var snap =
          await FirebaseFirestore.instance.collection("user").doc(userId).get();
      var userData = snap.data();

      fetchedPatient = Patient(
        id: userId,
        email: userData['email'] ?? "anyemail",
        phone: userData['phone'] ?? 1234565,
      );
    } catch (error) {
      print(error);
    }
  }

  Patient get fetchedPatientDetails {
    return fetchedPatient;
  }
}
