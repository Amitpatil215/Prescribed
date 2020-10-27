import 'package:doctor_duniya/widgets/b_a_widgets/b_a_v_s_appoint_detail_card.dart';
import 'package:flutter/material.dart';
import '../../widgets/colors.dart';

class AppointmentConnectScreen extends StatelessWidget {
  static const routeName = 'appoint-connect';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: appBarColor,
      ),
      body: Column(
        children: [
          Center(child: BAVSAppointmentDetailsCard()),
          SizedBox(height: 7),
          Text("Booked on : 24 Octobar 2020, 6:00PM"),
        ],
      ),
    );
  }
}
