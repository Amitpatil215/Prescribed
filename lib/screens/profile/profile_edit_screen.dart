import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../Model/patient.dart';
import '../../widgets/p_edit_s_widgets/p_e_s_dropDownButton.dart';

class ProfileEditScreen extends StatelessWidget {
  static const routName = '/profile-edit';
  final userId = FirebaseAuth.instance.currentUser.uid;

  final _formKey = GlobalKey<FormState>();

  String _name = '';
  String _location = '';
  int _contactNo;
  String _emailAddress = '';
  String _genderString = '';
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

  void _selectedGenderIndex(int index) {
    _genderIndex = index;
  }

  void _saveForm(BuildContext context) async {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      final userID = FirebaseAuth.instance.currentUser.uid;
      try {
        await FirebaseFirestore.instance.collection("user").doc(userID).set({
          "name": _name,
          "gender": _genderIndex,
          "location": _location,
          "phone": _contactNo,
          "email": _emailAddress,
        });
      } catch (error) {
        print("Error in storing profile edit page with $error");
      }
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    final _userData = Provider.of<Patient>(context, listen: true);
    _name = _userData.name;
    _genderIndex = _userData.gender.index;
    _location = _userData.location.address;
    _contactNo = _userData.phone;
    _emailAddress = _userData.email;

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
                        initialValue: _name,
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
                          _name = value;
                        },
                      ),
                    )
                  ],
                ),
              ),
              GenderDropDownButton(_genderIndex, _selectedGenderIndex),
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
                        initialValue: _location,
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
                          _location = value;
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
                        initialValue: _contactNo.toString(),
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
                          _contactNo = int.parse(value);
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
                        initialValue: _emailAddress,
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
                          _emailAddress = value;
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
                      _saveForm(context);
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
