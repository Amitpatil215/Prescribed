import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'a_s_authOTPForm.dart';

class ASAuthForm extends StatefulWidget {
  @override
  _ASAuthFormState createState() => _ASAuthFormState();
}

class _ASAuthFormState extends State<ASAuthForm> {
  var _phoneNo = '';
  final _formKey = GlobalKey<FormState>();

  void _trySubmit() {
    final isValid = _formKey.currentState.validate();
    //for closing soft keyboard
    FocusScope.of(context).unfocus();

    if (isValid) {
      _formKey.currentState.save();
      Scaffold.of(context).showSnackBar(
        SnackBar(
          content: Text("Sending OTP request..."),
          backgroundColor: Colors.purple,
        ),
      );
      _submitAuthForm(phoneNo: _phoneNo);
    }
  }

  Future<void> _submitAuthForm({String phoneNo}) async {
    print("------submit auth form running");
    try {
      final _auth = FirebaseAuth.instance;

      String _verificationId;
      await _auth.verifyPhoneNumber(
        phoneNumber: '\+91$phoneNo',
        timeout: Duration(minutes: 2),
        verificationCompleted: (PhoneAuthCredential credential) async {
          // only call back when it automatically signs in user not manually
          // signing in user by credentials
          final authResult = await _auth.signInWithCredential(credential);

          //containes additionl user specific information
          User user = authResult.user;
          print(
              "Signed in user automatically by otp sent no need to provide otp $user");
        },
        verificationFailed: (FirebaseAuthException e) {
          //if wrong no or wrong otp entered
          print("Reason due to varification failed: $e");
        },
        codeSent: (String verificationId, [int resendToken]) async {
          print("Code Sent run start");
          _verificationId = verificationId;

          //it will run even if it fiding automatically
          //once code is sent it calls
          // first .trim()
          await Navigator.of(context)
              .push(MaterialPageRoute(
            builder: (context) => ASOTPForm(),
          ))
              .then((otp) async {
            if (otp == null) {
              Scaffold.of(context).removeCurrentSnackBar();
              Scaffold.of(context).showSnackBar(
                SnackBar(
                  content: Text("Try loging in again.."),
                  backgroundColor: Theme.of(context).errorColor,
                ),
              );
              return;
            }
            print("Done bro" + otp);
            final credential = PhoneAuthProvider.credential(
                verificationId: verificationId, smsCode: otp);
            try {
              // signing in user by credentials
              final authResult = await _auth.signInWithCredential(credential);
              //containes additionl user specific information
              User user = authResult.user;
              print("Logging in user by otp sent");
            } catch (error) {
              if (error == "invalid-verification-code") {
                Scaffold.of(context).showSnackBar(
                  SnackBar(
                    content: Text("Invalid OTP entered"),
                    backgroundColor: Theme.of(context).errorColor,
                  ),
                );
              }
            }
          });
        },
        codeAutoRetrievalTimeout: (String verificationId) {
          print("code auto retrival running");
          _verificationId = verificationId;
        },
      );
    } on PlatformException catch (error) {
      print("platform exception error handling" + error.code);
    } catch (error) {
      print("Errorr getting from: Authentication page" + error);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        margin: EdgeInsets.all(20),
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(children: <TextSpan>[
                    TextSpan(
                      text: 'We will send you an ',
                      style: TextStyle(color: Colors.black),
                    ),
                    TextSpan(
                        text: 'One Time Password ',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        )),
                    TextSpan(
                      text: 'on this mobile number',
                      style: TextStyle(color: Colors.black),
                    ),
                  ]),
                ),
                SizedBox(
                  height: 18,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: "Phone No",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    hintText: "+91..",
                  ),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value.length < 10) {
                      return "Enter valid Mobile No";
                    } else if (value.length == 10) {
                      return null;
                    }
                    return "Check Credientials";
                  },
                  onSaved: (newValue) {
                    _phoneNo = newValue;
                  },
                ),
                SizedBox(
                  height: 18,
                ),
                RaisedButton(
                  padding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Next..",
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                        ),
                      ),
                      Icon(
                        Icons.navigate_next,
                        color: Colors.white,
                      ),
                    ],
                  ),
                  onPressed: _trySubmit,
                  elevation: 10,
                  color: Colors.purpleAccent,
                )
              ],
            ),
          ),
        ),
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    );
  }
}
