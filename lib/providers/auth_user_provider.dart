import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

class AuthUser with ChangeNotifier {
  var _isPatient = true;

  String get userId {
    try {
      var _uid = FirebaseAuth.instance.currentUser.uid;
      return _uid;
    } catch (error) {
      print("Error in Auth User Provider - $error");
    }
  }

  void setUserTypeIsPatient(bool isHePatient) {
    _isPatient = isHePatient;
    notifyListeners();
  }

  bool get getUserTypeisPatient {
    return _isPatient;
  }
}
