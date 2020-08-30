import 'package:flutter/material.dart';

class ProfileEditScreen extends StatefulWidget {
  static const routName = '/profile-edit';

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

  void _saveForm() {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
    }
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
        ));
  }
}
