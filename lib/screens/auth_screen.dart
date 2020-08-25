import 'package:doctor_duniya/widgets/a_s_authOTPForm.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../widgets/a_s_authForm.dart';

class AuthScreen extends StatefulWidget {
  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  void _submitAuthForm(String phoneNo) async {
    //  try {
    // await FirebaseAuth.instance.verifyPhoneNumber(
    //   phoneNumber: '\+91$phoneNo',
    //   verificationCompleted: (PhoneAuthCredential credential) {
    //     print(credential);
    //   },
    //   verificationFailed: (FirebaseAuthException e) {
    //     print(e);
    //   },
    //   codeSent: (String verificationId, int resendToken) {},
    //   codeAutoRetrievalTimeout: (String verificationId) {},
    // );
    // } on PlatformException catch (error) {
    //   var message = "An error occured, Please check your credientials!";
    //   if (error.message != null) {
    //     message = error.message;
    //   }
    //   Scaffold.of(context).showSnackBar(
    //     SnackBar(
    //       content: Text(message),
    //       backgroundColor: Theme.of(context).errorColor,
    //     ),
    //   );
    // } catch (error) {
    //   print(error);
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ASAuthForm(_submitAuthForm),
    );
  }
}
