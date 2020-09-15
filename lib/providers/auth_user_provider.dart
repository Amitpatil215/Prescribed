import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import '../Model/userType.dart';

class AuthUser with ChangeNotifier {
  var isPatient = true;

  String get userId {
    try {
      var _uid = FirebaseAuth.instance.currentUser.uid;
      return _uid;
    } catch (error) {
      print("Error in Auth User Provider - $error");
    }
  }

  Future<void> setUserTypeIsPatient(bool isHePatient) async {
    print("set user as patient- $isHePatient");
    isPatient = isHePatient;
    notifyListeners();
  }

  Stream<UserType> getUserTypeisPatient() {
    print("Getting user type from firestore");
    try {
      var userId = FirebaseAuth.instance.currentUser.uid;
      var snapshot =
          FirebaseFirestore.instance.collection("user").doc(userId).snapshots();

      return snapshot.map((event) {
        return UserType(
          isPatient: event.data()['isPatient'],
        );
      });
    } catch (error) {
      print("error in fetching error $error");
    }
    notifyListeners();
  }
}
