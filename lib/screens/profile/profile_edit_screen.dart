import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ProfileEditScreen extends StatefulWidget {
  static const routName = '/profile-edit';
  final userId = FirebaseAuth.instance.currentUser.uid;
  @override
  _ProfileEditScreenState createState() => _ProfileEditScreenState();
}

class _ProfileEditScreenState extends State<ProfileEditScreen> {
  final _formKey = GlobalKey<FormState>();
  int _selectedGender = 0;
  String _name = '';
  String _location = '';
  int _contactNo;
  String _emailAddress = '';

  List<DropdownMenuItem<int>> genderList = [];

  void _saveForm() async {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();

      final userID = FirebaseAuth.instance.currentUser.uid;
      try {
        await FirebaseFirestore.instance.collection("user").doc(userID).set({
          "name": _name,
          "gender": genderString,
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

  String get genderString {
    if (_selectedGender == 0) {
      return "Male";
    } else if (_selectedGender == 1) {
      return "Female";
    } else if (_selectedGender == 2) {
      return "Other";
    }
    return null;
  }

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

  void loadGenderList() {
    genderList = [];
    genderList.add(new DropdownMenuItem(
      child: new Text('Male'),
      value: 0,
    ));
    genderList.add(new DropdownMenuItem(
      child: new Text('Female'),
      value: 1,
    ));
    genderList.add(new DropdownMenuItem(
      child: new Text('Other'),
      value: 2,
    ));
  }

  @override
  Widget build(BuildContext context) {
    loadGenderList();
    return Scaffold(
        resizeToAvoidBottomPadding: false,
        backgroundColor: Theme.of(context).backgroundColor,
        appBar: AppBar(
          title: Text("Edit Profille"),
        ),
        body: StreamBuilder(
            stream: FirebaseFirestore.instance
                .collection("user")
                .doc(widget.userId)
                .snapshots(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return CircularProgressIndicator();
              }
              final userData = snapshot.data.data();
              _name = userData['name'];
              //  _selectedGender = genderIndex(userData['gender']);
              _location = userData['location'];
              _contactNo = userData['phone'];
              _emailAddress = userData['email'];
              return Container(
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
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 10),
                        child: Row(
                          children: [
                            Icon(
                              null,
                              size: 30,
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            Expanded(
                              child: FormField(
                                builder: (FormFieldState<String> state) {
                                  return InputDecorator(
                                    decoration: InputDecoration(
                                      labelText: "Gender",
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                    ),
                                    child: DropdownButtonHideUnderline(
                                      child: DropdownButton(
                                        isDense: true,
                                        hint: Text("Select Gender"),
                                        items: [...genderList],
                                        value: _selectedGender,
                                        isExpanded: true,
                                        onChanged: (value) {
                                          setState(() {
                                            _selectedGender = value;
                                          });
                                        },
                                      ),
                                    ),
                                  );
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
                            onPressed: _saveForm,
                            elevation: 5,
                          )),
                    ],
                  ),
                ),
              );
            }));
  }
}
