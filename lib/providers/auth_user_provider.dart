import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

class AuthUser with ChangeNotifier {
  var _uid = FirebaseAuth.instance.currentUser.uid;

  String get userId {
    return _uid;
  }
}
