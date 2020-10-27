import 'package:doctor_duniya/screens/profile/my_appointment_screen.dart';
import 'package:flutter/material.dart';

class PSAppointmentButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 10,
      ),
      child: RaisedButton(
        child: Container(
          margin: EdgeInsets.symmetric(
            horizontal: 10,
          ),
          height: 50,
          width: double.infinity,
          child: Center(child: Text("My Appointments")),
        ),
        color: Colors.white,
        elevation: 8,
        onPressed: () {
          Navigator.of(context).pushNamed(AppointmentScreen.routName);
        },
      ),
    );
  }
}
