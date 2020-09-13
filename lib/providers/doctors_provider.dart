import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import '../Model/doctor.dart';

class DoctorsProvider with ChangeNotifier {
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
    } catch (error) {
      print("Error in storing Doctor profile  with- $error");
    }
    notifyListeners();
    print("Saving to Firestore Done...");
  }
}
