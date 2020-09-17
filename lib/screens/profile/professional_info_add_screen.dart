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
                        FlutterIcons.profile_ant,
                        size: 30,
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Expanded(
                        child: TextFormField(
                          // initialValue: _userData.bloodSugar != null
                          //     ? _userData.bloodSugar.toString()
                          //     : "",
                          decoration: InputDecoration(
                            hintText: "e.g Psychiatrist",
                            labelText: "Domain",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                            ),
                          ),
                          keyboardType: TextInputType.number,
                          onSaved: (value) {
                            if (value == null) {
                              value = "";
                            }
                            // _userData.bloodSugar = double.tryParse(value);
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
                          // initialValue: _userData.bloodPressure != null
                          //     ? _userData.bloodPressure.toString()
                          //     : "",
                          decoration: InputDecoration(
                            hintText: "e.g MBBS,MD",
                            labelText: "Degree",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                            ),
                          ),
                          onSaved: (value) {
                            if (value == null) {
                              value = "";
                            }
                            // _userData.bloodPressure = double.tryParse(value);
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
                          // initialValue: _userData.heartRate != null
                          //     ? _userData.heartRate.toString()
                          //     : "",
                          decoration: InputDecoration(
                            hintText: "e.g. Loyala University",
                            labelText: "University Name",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                            ),
                          ),
                          onSaved: (value) {
                            if (value == null) {
                              value = "";
                            }
                            // _userData.heartRate = double.tryParse(value);
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
                          // initialValue: _userData.bloodPressure != null
                          //     ? _userData.bloodPressure.toString()
                          //     : "",
                          decoration: InputDecoration(
                            hintText: "e.g Hindi, English",
                            labelText: "Languages",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                            ),
                          ),
                          onSaved: (value) {
                            if (value == null) {
                              value = "";
                            }
                            // _userData.bloodPressure = double.tryParse(value);
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
                          // initialValue: _userData.allergy != null
                          //     ? _userData.allergy
                          //     : "",
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
                            // _userData.allergy = value;
                          },
                          keyboardType: TextInputType.number,
                          maxLines: 4,
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
                      //   _saveForm(context, _userData);
                    },
                    elevation: 5,
                  ),
                ),
              ],
            ),
          ),
        )
        //  ),
        );
  }
}
