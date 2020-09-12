import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doctor_duniya/providers/patient_profile_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../Model/patient.dart';
import '../../widgets/p_edit_s_widgets/p_e_s_dropDownButton.dart';

class ProfileEditScreen extends StatelessWidget {
  static const routName = '/profile-edit';
  final userId = FirebaseAuth.instance.currentUser.uid;

  final _formKey = GlobalKey<FormState>();

  int _genderIndex;

  int genderIndex(String _initialValue) {
    if (_initialValue == "Male") {
      return 0;
    } else if (_initialValue == "Female") {
      return 1;
    } else if (_initialValue == "Other") {
      return 2;
    }
    return null;
  }

  

  void _saveForm(BuildContext context, Patient editedUser) async {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      await Provider.of<PatientProfileProvider>(context, listen: false)
          .saveEditedUser(editedUser)
          .then((value) {
        print("Done");
      });
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    var _userData = Provider.of<Patient>(context, listen: true);

    return Scaffold(
      resizeToAvoidBottomPadding: false,
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        title: Text("Edit Profille"),
      ),
      body: Container(
        margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.symmetric(vertical: 10),
                child: Row(
                  children: [
                    Icon(
                      Icons.person,
                      size: 30,
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Expanded(
                      child: TextFormField(
                        initialValue: _userData.name,
                        decoration: InputDecoration(
                          hintText: "e.g Zakir Khan",
                          labelText: "Your Full Name",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                        validator: (value) {
                          if (value.isNotEmpty) {
                            return null;
                          } else {
                            return "Please provide your name";
                          }
                        },
                        onSaved: (value) {
                          _userData.name = value;
                        },
                      ),
                    )
                  ],
                ),
              ),
              GenderDropDownButton(
                  _userData.gender.index, _userData),
              Container(
                margin: EdgeInsets.symmetric(vertical: 10),
                child: Row(
                  children: [
                    Icon(
                      Icons.location_on,
                      size: 30,
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Expanded(
                      child: TextFormField(
                        initialValue: _userData.location.address,
                        decoration: InputDecoration(
                          hintText: "e.g. Noida",
                          labelText: "Home Location",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                        validator: (value) {
                          if (value.isNotEmpty) {
                            return null;
                          } else {
                            return "Enter Valid Location";
                          }
                        },
                        onSaved: (value) {
                          _userData.location.address = value;
                        },
                      ),
                    )
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 10),
                child: Row(
                  children: [
                    Icon(
                      Icons.phone,
                      size: 30,
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Expanded(
                      child: TextFormField(
                        initialValue: _userData.phone.toString(),
                        decoration: InputDecoration(
                          hintText: "e.g. +91 1234567890",
                          labelText: "Contact Number",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                        validator: (value) {
                          if (value.length == 10) {
                            return null;
                          } else {
                            return "Enter Correct Contact Details";
                          }
                        },
                        onSaved: (value) {
                          _userData.phone = int.parse(value);
                        },
                      ),
                    )
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 10),
                child: Row(
                  children: [
                    Icon(
                      Icons.email,
                      size: 30,
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Expanded(
                      child: TextFormField(
                        initialValue: _userData.email,
                        decoration: InputDecoration(
                          hintText: "e.g. doctorDuniya@gmail.com",
                          labelText: "Email Address",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                        validator: (value) {
                          if (value.isNotEmpty) {
                            return null;
                          } else {
                            return "Enter Valid Email Address";
                          }
                        },
                        onSaved: (value) {
                          _userData.email = value;
                        },
                      ),
                    )
                  ],
                ),
              ),
              Spacer(),
              Container(
                  margin: EdgeInsets.only(bottom: 25),
                  child: RaisedButton(
                    child: Text(
                      "Save",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    onPressed: () {
                      _saveForm(context, _userData);
                    },
                    elevation: 5,
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
