import 'package:flutter/material.dart';
import '../../screens/profile/profile_edit_screen.dart';
import 'package:provider/provider.dart';
import '../../Model/patient.dart';
import '../../providers/auth_user_provider.dart';
import '../../Model/doctor.dart';

class PSEmailPhoneCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var _userData;
    var _isPatient = Provider.of<AuthUser>(context).isPatient;
    if (_isPatient) {
      _userData = Provider.of<Patient>(context, listen: true);
    } else {
      _userData = Provider.of<Doctor>(context, listen: true);
    }

    return Container(
      margin: EdgeInsets.symmetric(vertical: 2, horizontal: 40),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(Icons.email),
                  SizedBox(
                    width: 10,
                  ),
                  _userData != null
                      ? Text(_userData.email ?? "Your Email")
                      : CircularProgressIndicator(),
                ],
              ),
              SizedBox(
                height: 2,
              ),
              Row(
                children: [
                  Icon(Icons.phone_android),
                  SizedBox(
                    width: 10,
                  ),
                  _userData != null
                      ? Text(_userData.phone != null
                          ? "+${_userData.phone.toString()}"
                          : "Your Contact")
                      : CircularProgressIndicator(),
                ],
              ),
            ],
          ),
          OutlineButton.icon(
            icon: Icon(Icons.edit),
            label: Text("Edit"),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            onPressed: () {
              Navigator.of(context).pushNamed(ProfileEditScreen.routName);
            },
          )
        ],
      ),
    );
  }
}
