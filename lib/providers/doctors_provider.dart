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
          profileImageUrl: event.data()['profileImageUrl'],
          phone: event.data()['phone'],
          email: event.data()['email'],
          address: event.data()['address'],
          language: event.data()['language'],
          field: event.data()['field'],
          degree: event.data()['degree'],
          experience: event.data()['experience'],
          university: event.data()['university'],
          moreDetails: event.data()['moreDetails'],
          tfrom: event.data()['tfrom'] != null
              ? DateTime.parse(event.data()['tfrom'])
              : null,
          tto: event.data()['tto'] != null
              ? DateTime.parse(event.data()['tto'])
              : null,
          cfrom: event.data()['cfrom'] != null
              ? DateTime.parse(event.data()['cfrom'])
              : null,
          cto: event.data()['cto'] != null
              ? DateTime.parse(event.data()['cto'])
              : null,
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
        "address": editedUser.address,
        "phone": editedUser.phone,
        "email": editedUser.email,
        "language": editedUser.language,
        "field": editedUser.field,
        "degree": editedUser.degree,
        "university": editedUser.university,
        "moreDetails": editedUser.moreDetails,
        "experience": editedUser.experience,
        "tfrom": editedUser.tfrom != null
            ? editedUser.tfrom.toIso8601String()
            : null,
        "tto": editedUser.tto != null ? editedUser.tto.toIso8601String() : null,
        "cfrom": editedUser.cfrom != null
            ? editedUser.cfrom.toIso8601String()
            : null,
        "cto": editedUser.cto != null ? editedUser.cto.toIso8601String() : Null,
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
        "profileImageUrl": null,
        "location": null,
        "address": null,
        "email": null,
        "language": null,
        "field": null,
        "degree": null,
        "experience": null,
        "university": null,
        "moreDetails": null,
        "tfrom": null,
        "tto": null,
        "cfrom": null,
        "cto": null,
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
