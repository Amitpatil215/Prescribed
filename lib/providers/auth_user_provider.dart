import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

class AuthUser with ChangeNotifier {
  String get userId {
    try {
      var _uid = FirebaseAuth.instance.currentUser.uid;
      return _uid;
    } catch (error) {
      print("Error in Auth User Provider - $error");
    }
  }
}
