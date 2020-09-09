import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../../widgets/p_s_widgets/p_s_email_phone_Card.dart';
import '../../widgets/p_s_widgets/p_s_pic_name_ListTile.dart';
import '../../widgets/p_s_widgets/p_s_health_measures.dart';
import '../../widgets/p_s_widgets/p_s_appointment_button.dart';
import '../../widgets/p_s_widgets/p_s_setting_button.dart';
import '../../widgets/p_s_widgets/p_s_latest_appointment.dart';

class ProfileScreen extends StatelessWidget {
  static const rountName = '/profile';
  final userId = FirebaseAuth.instance.currentUser.uid;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: Container(
        margin: EdgeInsets.only(top: 30),
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: Icon(Icons.arrow_back),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  PSSettingButton(),
                ],
              ),
            ),
            PSPicNameListTile(userId),
            PSEmailPhoneCard(userId),
            PSAppointmentButton(),
            Expanded(
              child: ListView(
                children: [
                  PSHealthMeasures(),
                  SizedBox(
                    height: 10,
                  ),
                  PSLatestAppointment(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
