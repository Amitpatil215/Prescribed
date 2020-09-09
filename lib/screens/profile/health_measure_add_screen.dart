import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

class HealthMeasureAddScreen extends StatefulWidget {
  static const routeName = "health-measure-edit";

  @override
  _HealthMeasureAddScreenState createState() => _HealthMeasureAddScreenState();
}

class _HealthMeasureAddScreenState extends State<HealthMeasureAddScreen> {
  final _formKey = GlobalKey<FormState>();
  String _sugar;
  String _pressure;
  String _heartRate;
  var _allergy = '';
  void _saveForm(BuildContext context) async {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();

      // final userID = FirebaseAuth.instance.currentUser.uid;
      // try {
      //   await FirebaseFirestore.instance.collection("user").doc(userID).set({
      //     "name": _name,
      //     "gender": _genderString,
      //     "location": _location,
      //     "phone": _contactNo,
      //     "email": _emailAddress,
      //   });
      // } catch (error) {
      //   print("Error in storing profile edit page with $error");
      // }
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
        body:
            // StreamBuilder(
            // stream: FirebaseFirestore.instance
            //     .collection("user")
            //     .doc(userId)
            //     .snapshots(),
            // builder: (context, snapshot) {
            //   if (snapshot.connectionState == ConnectionState.waiting) {
            //     return CircularProgressIndicator();
            //   }
            //   final userData = snapshot.data.data();
            //   if (userData != null) {
            //     _name = userData['name'];
            //     _genderString = userData['gender'];
            //     _location = userData['location'];
            //     _contactNo = userData['phone'];
            //     _emailAddress = userData['email'];
            //   }
            //return
            Container(
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
                          // initialValue: _name,
                          decoration: InputDecoration(
                            hintText: "e.g 120",
                            labelText: "Blood Sugar",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                            ),
                          ),
                          keyboardType: TextInputType.number,
                          onSaved: (value) {
                            _sugar = value;
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
                          // initialValue: _name,
                          decoration: InputDecoration(
                            hintText: "e.g 120",
                            labelText: "Blood Pressure",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                            ),
                          ),

                          onSaved: (value) {
                            _pressure = value;
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
                          // initialValue: _name,
                          decoration: InputDecoration(
                            hintText: "e.g. 98",
                            labelText: "Heart Rate",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                            ),
                          ),

                          onSaved: (value) {
                            _heartRate = value;
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
                          // initialValue: _name,
                          decoration: InputDecoration(
                            hintText: "Dust allergy",
                            labelText: "Allergy",
                            alignLabelWithHint: true,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                            ),
                          ),

                          onSaved: (value) {
                            _allergy = value;
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
                      _saveForm(context);
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
