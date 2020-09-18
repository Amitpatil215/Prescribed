import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import '../Model/doctor.dart';

class DoctorsProvider with ChangeNotifier {
  Stream<Doctor> doctorData() {
    print("Doctor Data Running");
    try {
      var userId = FirebaseAuth.instance.currentUser.uid;
      var snapshot = FirebaseFirestore.instance
          .collection("doctor")
          .doc(userId)
          .snapshots();

      return snapshot.map((event) {
        return Doctor(
          name: event.data()['name'],
          phone: event.data()['phone'],
          email: event.data()['email'],
          location: GeoLocation(
            longitude: null,
            latitude: null,
            address: event.data()['location'],
          ),
          language: event.data()['language'],
          field: event.data()['field'],
          degree: event.data()['degree'],
          experience: event.data()['experience'],
          university: event.data()['university'],
          moreDetails: event.data()['moreDetails'],
          tfrom: DateTime.parse(event.data()['tfrom']),
          tto: DateTime.parse(event.data()['tto']),
          cfrom: DateTime.parse(event.data()['cfrom']),
          cto: DateTime.parse(event.data()['cto']),
        );
      });
    } catch (error) {
      print("error in fetching error $error");
    }
    notifyListeners();
  }

  Future<void> saveEditedUser(Doctor editedUser) async {
    try {
      var userId = FirebaseAuth.instance.currentUser.uid;
      await FirebaseFirestore.instance.collection("doctor").doc(userId).set({
        "name": editedUser.name,
        "location": editedUser.location.address,
        "phone": editedUser.phone,
        "email": editedUser.email,
        "language": editedUser.language,
        "field": editedUser.field,
        "degree": editedUser.degree,
        "university": editedUser.university,
        "moreDetails": editedUser.moreDetails,
        "experience": editedUser.experience,
        "tfrom": editedUser.tfrom.toIso8601String(),
        "tto": editedUser.tto.toIso8601String(),
        "cfrom": editedUser.cfrom.toIso8601String(),
        "cto": editedUser.cto.toIso8601String(),
      });
    } catch (error) {
      print("Error in storing profile edit page with- $error");
    }
    notifyListeners();
    print("Saving to Firestore Done...");
  }

  Future<void> createNewUser([Doctor editedUser]) async {
    try {
      var userId = FirebaseAuth.instance.currentUser.uid;
      await FirebaseFirestore.instance.collection("doctor").doc(userId).set({
        "id": editedUser.id ?? userId,
        "phone": editedUser.phone,
        "name": null,
        "location": null,
        "email": null,
        "language": null,
        "field": null,
        "degree": null,
        "experience": null,
        "university": null,
        "moreDetails": null,
      });
      await FirebaseFirestore.instance.collection("user").doc(userId).set({
        "isPatient": false,
      });
    } catch (error) {
      print("Error in storing Doctor profile  with- $error");
    }
    notifyListeners();
    print("Saving to Firestore Done...");
  }
}
