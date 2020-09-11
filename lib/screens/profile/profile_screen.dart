import 'package:doctor_duniya/providers/auth_user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/patient_profile_provider.dart';
import '../../widgets/p_s_widgets/p_s_email_phone_Card.dart';
import '../../widgets/p_s_widgets/p_s_pic_name_ListTile.dart';
import '../../widgets/p_s_widgets/p_s_health_measures.dart';
import '../../widgets/p_s_widgets/p_s_appointment_button.dart';
import '../../widgets/p_s_widgets/p_s_setting_button.dart';
import '../../widgets/p_s_widgets/p_s_latest_appointment.dart';

class ProfileScreen extends StatefulWidget {
  static const rountName = '/profile';

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  var _isLoading = false;

  // @override
  // void didChangeDependencies() {
  //   if (_isLoading == false) {
  //     setState(() {
  //       _isLoading = true;
  //     });
  //     _isLoading = true;

  //     Provider.of<PatientProfileProvider>(context)
  //         .fetchAndSetPatient(context)
  //         .then(
  //           (_) => setState(() {
  //             _isLoading = false;
  //           }),
  //         );
  //     super.didChangeDependencies();
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    final userId = Provider.of<AuthUser>(context).userId;
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
            PSEmailPhoneCard(_isLoading),
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
