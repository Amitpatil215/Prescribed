import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../Model/patient.dart';

class UserProfile with ChangeNotifier {
  final userId = FirebaseAuth.instance.currentUser.uid;

  Future<void> fetchAndSetUserProfile() async {
    final snapshot =
        await FirebaseFirestore.instance.collection("user").doc(userId).get();
    final userData = snapshot.data();
    final userInfo = Patient(
      id: userId,
      name: userData['name'],
      gender: null,
      dateOfBirth: null,
      phone: userData['phone'],
      email: null,
      location: null,
    );
    print("Fetching and setting userProfile");
  }

  Patient get userInfo {
    print("Getting userinfo");
    return userInfo;
  }
}
