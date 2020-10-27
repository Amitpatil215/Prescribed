import 'package:doctor_duniya/widgets/b_a_widgets/b_a_v_s_appoint_detail_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../widgets/colors.dart';

class VerifyAppointmentScreen extends StatelessWidget {
  static const routeName = 'verify-appoint';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: appBarColor,
      ),
      body: Column(
        children: [
          Text(
            "Verify Appointment Dates",
            style: TextStyle(fontSize: 25),
          ),
          SizedBox(height: 7),
          Center(
            child: Container(
              height: 200,
              width: 250,
              child: SvgPicture.asset(
                "assets/images/verify.svg",
                fit: BoxFit.fill,
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(18),
            child: Text(
              "Please Check date and time and confirm the appoitment for your next examination",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.grey),
            ),
          ),
          BAVSAppointmentDetailsCard(),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(
        label: Row(
          children: [
            Text(
              "Confirm Appointment",
              style: TextStyle(color: Colors.black),
            ),
            SizedBox(width: 10),
            Icon(
              Icons.check,
              color: Colors.green,
            ),
          ],
        ),
        isExtended: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        onPressed: () {},
      ),
    );
  }
}
