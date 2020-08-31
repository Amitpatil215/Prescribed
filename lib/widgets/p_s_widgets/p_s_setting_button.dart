import 'package:doctor_duniya/screens/home/home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class PSSettingButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: DropdownButton(
        icon: Icon(Icons.settings),
        isDense: true,
        items: [
          DropdownMenuItem(
            child: Text("Log Out"),
            value: "Log-Out",
          )
        ],
        onChanged: (value) {
          if (value == "Log-Out") {
            Navigator.of(context).pushReplacementNamed('/');
            FirebaseAuth.instance.signOut();
          }
        },
      ),
    );
  }
}
