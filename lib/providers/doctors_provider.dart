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
        );
      });
    } catch (error) {
      print("error in fetching error $error");
    }

    notifyListeners();
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
