import 'package:flutter/material.dart';
import 'appoint_s_appointment_title.dart';

class AppointSTabBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TabBarView(children: [
      ListView.builder(
        itemCount: 8,
        itemBuilder: (context, index) => ASAppointmentTile(),
      ),
      ListView.builder(
        itemCount: 8,
        itemBuilder: (context, index) => ASAppointmentTile(),
      ),
    ]);
  }
}
