import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'auth_user_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FirestoreImageUpload with ChangeNotifier {
  var userId = FirebaseAuth.instance.currentUser.uid;

  Future<void> uploadProfileImage(File image, BuildContext context) async {
    try {
      ///getting path of file bucket
      final _ref = FirebaseStorage.instance
          .ref()
          .child('user_profile_image')
          .child(userId + '.jpg');

      //uploading image to that path
      await _ref.putFile(image).onComplete;

      //getting that image url for easy acess
      final imageUrl = await _ref.getDownloadURL();

      //getting user Type
      var _isPatient = Provider.of<AuthUser>(context, listen: false).isPatient;

      //saving image url into database
      await FirebaseFirestore.instance
          .collection(_isPatient ? "patient" : "doctor")
          .doc(userId)
          .update(
        {
          "profileImageUrl": imageUrl,
        },
      );

      //
    } catch (error) {
      debugPrint("Error Occured in firestor image uplaoding :$error");
    }
  }
}
