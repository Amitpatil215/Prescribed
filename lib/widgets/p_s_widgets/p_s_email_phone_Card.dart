import 'package:doctor_duniya/Model/patient.dart';
import 'package:doctor_duniya/providers/patient_profile_provider.dart';
import 'package:flutter/material.dart';
import 'package:doctor_duniya/screens/profile/profile_edit_screen.dart';
import 'package:provider/provider.dart';

class PSEmailPhoneCard extends StatelessWidget {
  bool _isLoading;
  PSEmailPhoneCard(this._isLoading);
  Patient userData;
  @override
  Widget build(BuildContext context) {
    final userData = Provider.of<Patient>(context, listen: true);
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
                  userData != null
                      ? Text(userData.email)
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
                  userData != null
                      ? Text(userData.phone.toString())
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
