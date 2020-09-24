import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_icons/flutter_icons.dart';
import '../../Model/doctor.dart';
import '../../providers/doctors_provider.dart';

class ProfessionalInfoAddScreen extends StatelessWidget {
  static const routName = "profession-info";
  final _formKey = GlobalKey<FormState>();

  void _saveForm(BuildContext context, Doctor editedUser) async {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();

      await Provider.of<DoctorsProvider>(context, listen: false)
          .saveEditedUser(editedUser)
          .then((value) {});
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    var _userData = Provider.of<Doctor>(context, listen: true);
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        title: Text("Professional Information"),
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
                      FlutterIcons.profile_ant,
                      size: 30,
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Expanded(
                      child: TextFormField(
                        initialValue: _userData.field != null
                            ? _userData.field.toString()
                            : "",
                        decoration: InputDecoration(
                          hintText: "e.g Psychiatrist",
                          labelText: "Domain",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                        keyboardType: TextInputType.number,
                        onSaved: (value) {
                          if (value.isEmpty) {
                            value = null;
                          }
                          _userData.field = value;
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
                      FlutterIcons.graduation_cap_ent,
                      size: 30,
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Expanded(
                      child: TextFormField(
                        initialValue: _userData.degree != null
                            ? _userData.degree.toString()
                            : "",
                        decoration: InputDecoration(
                          hintText: "e.g MBBS,MD",
                          labelText: "Degree",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                        onSaved: (value) {
                          if (value.isEmpty) {
                            value = null;
                          }
                          _userData.degree = value;
                        },
                        keyboardType: TextInputType.number,
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
                      FlutterIcons.sina_weibo_mco,
                      size: 30,
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Expanded(
                      child: TextFormField(
                        initialValue: _userData.experience != null
                            ? _userData.experience.toString()
                            : "",
                        decoration: InputDecoration(
                          hintText: "e.g 10 yrs",
                          labelText: "Experience",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                        onSaved: (value) {
                          if (value == null) {
                            value = "0";
                          }
                          _userData.experience = int.tryParse(value);
                        },
                        keyboardType: TextInputType.number,
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
                      FlutterIcons.university_faw5s,
                      size: 30,
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Expanded(
                      child: TextFormField(
                        initialValue: _userData.university != null
                            ? _userData.university
                            : "",
                        decoration: InputDecoration(
                          hintText: "e.g. Loyala University",
                          labelText: "University Name",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                        onSaved: (value) {
                          if (value.isEmpty) {
                            value = null;
                          }
                          _userData.university = value;
                        },
                        keyboardType: TextInputType.number,
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
                      FlutterIcons.graduation_cap_ent,
                      size: 30,
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Expanded(
                      child: TextFormField(
                        initialValue: _userData.language != null
                            ? _userData.language
                            : "",
                        decoration: InputDecoration(
                          hintText: "e.g Hindi, English",
                          labelText: "Languages",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                        onSaved: (value) {
                          if (value.isEmpty) {
                            value = null;
                          }
                          _userData.language = value;
                        },
                        keyboardType: TextInputType.number,
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
                      FlutterIcons.description_mdi,
                      size: 30,
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Expanded(
                      child: TextFormField(
                        initialValue: _userData.moreDetails != null
                            ? _userData.moreDetails
                            : "",
                        decoration: InputDecoration(
                          hintText:
                              "Explain about your work, Why one Should appoint you?",
                          labelText: "Information",
                          alignLabelWithHint: true,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                        onSaved: (value) {
                          if (value.isEmpty) value = null;
                          _userData.moreDetails = value;
                        },
                        keyboardType: TextInputType.number,
                        maxLines: 4,
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
          _saveForm(context, _userData);
        },
      ),
    );
  }
}
