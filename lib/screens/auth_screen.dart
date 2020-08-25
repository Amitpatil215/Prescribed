import 'package:doctor_duniya/screens/home_screen.dart';
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
    final _auth = FirebaseAuth.instance;

    await _auth.verifyPhoneNumber(
      phoneNumber: '\+91$phoneNo',
      timeout: Duration(seconds: 60),
      verificationCompleted: (PhoneAuthCredential credential) async {
        // only call back when it automatically signs in user not manually
        // signing in user by credentials
        final authResult = await _auth.signInWithCredential(credential);

        //containes additionl user specific information
        User user = authResult.user;

        if (user != null) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => HomeScreen(),
            ),
          );
        }
        print(credential);
      },
      verificationFailed: (FirebaseAuthException e) {
        //if wrong no or wrong otp entered
        print(e);
      },
      codeSent: (String verificationId, int resendToken) async {
        //it will run even if it fiding automatically
        //once code is sent it calls
        // first .trim()
        final credential = PhoneAuthProvider.credential(
            verificationId: verificationId, smsCode: "any code recived");

        // signing in user by credentials
        final authResult = await _auth.signInWithCredential(credential);
        //containes additionl user specific information
        User user = authResult.user;

        if (user != null) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => HomeScreen(),
            ),
          );
        }
      },
      codeAutoRetrievalTimeout: (String verificationId) {},
    );
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
