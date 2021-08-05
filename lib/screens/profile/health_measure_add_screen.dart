import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../Model/patient.dart';
import '../../providers/patient_profile_provider.dart';
import 'package:flutter_icons/flutter_icons.dart';

class HealthMeasureAddScreen extends StatefulWidget {
  static const routeName = "health-measure-edit";

  @override
  _HealthMeasureAddScreenState createState() => _HealthMeasureAddScreenState();
}

class _HealthMeasureAddScreenState extends State<HealthMeasureAddScreen> {
  final _formKey = GlobalKey<FormState>();

  void _saveForm(BuildContext context, Patient editedUser) async {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();

      await Provider.of<PatientProfileProvider>(context, listen: false)
          .saveEditedUser(editedUser)
          .then((value) {});
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    var _userData = Provider.of<Patient>(context, listen: true);
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
                      FlutterIcons.droplet_fea,
                      size: 30,
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Expanded(
                      child: TextFormField(
                        initialValue: _userData.bloodSugar != null
                            ? _userData.bloodSugar.toString()
                            : "",
                        decoration: InputDecoration(
                          hintText: "e.g 120",
                          labelText: "Blood Sugar",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                        keyboardType: TextInputType.number,
                        onSaved: (value) {
                          if (value == null) {
                            value = "";
                          }
                          _userData.bloodSugar = double.tryParse(value);
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
                      FlutterIcons.cube_unfolded_mco,
                      size: 30,
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Expanded(
                      child: TextFormField(
                        initialValue: _userData.bloodPressure != null
                            ? _userData.bloodPressure.toString()
                            : "",
                        decoration: InputDecoration(
                          hintText: "e.g 120",
                          labelText: "Blood Pressure",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                        onSaved: (value) {
                          if (value == null) {
                            value = "";
                          }
                          _userData.bloodPressure = double.tryParse(value);
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
                      FlutterIcons.heartbeat_faw,
                      size: 30,
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Expanded(
                      child: TextFormField(
                        initialValue: _userData.heartRate != null
                            ? _userData.heartRate.toString()
                            : "",
                        decoration: InputDecoration(
                          hintText: "e.g. 98",
                          labelText: "Heart Rate",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                        onSaved: (value) {
                          if (value == null) {
                            value = "";
                          }
                          _userData.heartRate = double.tryParse(value);
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
                        initialValue:
                            _userData.allergy != null ? _userData.allergy : "",
                        decoration: InputDecoration(
                          hintText: "Dust allergy",
                          labelText: "Allergy",
                          alignLabelWithHint: true,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                        onSaved: (value) {
                          if (value.isEmpty) value = null;
                          _userData.allergy = value;
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
