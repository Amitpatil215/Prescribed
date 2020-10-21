import 'dart:io';

import 'package:doctor_duniya/providers/firestor_image_upload_provider.dart';
import 'package:doctor_duniya/providers/patient_profile_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../Model/patient.dart';
import '../../widgets/p_edit_s_widgets/p_e_s_dropDownButton.dart';
import '../../Model/doctor.dart';
import '../../providers/auth_user_provider.dart';
import '../../providers/doctors_provider.dart';
import '../../widgets/p_edit_s_widgets/p_e_s_pick_image.dart';

class ProfileEditScreen extends StatelessWidget {
  static const routName = '/profile-edit';
  final userId = FirebaseAuth.instance.currentUser.uid;
  var userData;
  static File image;

  void _pickedImage(File fnctionImage) {
    image = fnctionImage;
  }

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

  void _saveForm(BuildContext context, var editedUser, bool isPatient) async {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      if (isPatient) {
        await Provider.of<PatientProfileProvider>(context, listen: false)
            .saveEditedUser(editedUser)
            .then((value) {});
      } else {
        await Provider.of<DoctorsProvider>(context, listen: false)
            .saveEditedUser(editedUser)
            .then((value) {});
      }
      if (image != null) {
        await Provider.of<FirestoreImageUpload>(context, listen: false)
            .uploadProfileImage(image, context);
      }
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    var _isPatient = Provider.of<AuthUser>(context).isPatient;
    if (_isPatient) {
      userData = Provider.of<Patient>(context, listen: true);
    } else {
      userData = Provider.of<Doctor>(context, listen: true);
      print(userData.name);
    }
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
                padding: EdgeInsets.all(30),
                child: PESPickImage(
                  imagePickedFn: _pickedImage,
                ),
              ),
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
                        initialValue: userData.name,
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
                          userData.name = value;
                        },
                      ),
                    )
                  ],
                ),
              ),
              if (_isPatient)
                GenderDropDownButton(
                    userData.gender != null ? userData.gender.index ?? 0 : 0,
                    userData),
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
                        initialValue: userData.address,
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
                          userData.address = value;
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
                        initialValue: userData.phone.toString(),
                        decoration: InputDecoration(
                          hintText: "e.g. +91 1234567890",
                          labelText: "Contact Number",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                        validator: (value) {
                          if (value.length >= 10) {
                            return null;
                          } else {
                            return "Enter Correct Contact Details";
                          }
                        },
                        onSaved: (value) {
                          userData.phone = int.parse(value);
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
                        initialValue: userData.email,
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
                          userData.email = value;
                        },
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(
        label: Text(
          "Save",
          style: TextStyle(color: Colors.black),
        ),
        isExtended: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        onPressed: () {
          _saveForm(context, userData, _isPatient);
        },
      ),
    );
  }
}
