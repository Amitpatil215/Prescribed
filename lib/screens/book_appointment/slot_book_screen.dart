import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:provider/provider.dart';
import '../../widgets/b_a_widgets/b_a_s_b_date_selector.dart';
import '../../widgets/b_a_widgets/b_a_s_b_time_picker.dart';
import '../../providers/select_DateTimeType_provider.dart';
import '../../screens/book_appointment/verify_appointmenr_screen.dart';

class SlotBookScreen extends StatelessWidget {
  static const routeName = 'slot-book';
  @override
  Widget build(BuildContext context) {
    var _isTelemedication =
        Provider.of<SelectDateTimeTypeProvider>(context).fetchAppointTypeIsTele;
    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Dr. Shashikant Chaturvedhi"),
            Row(
              children: [
                Icon(
                    _isTelemedication
                        ? FlutterIcons.phone_faw
                        : FlutterIcons.hospital_o_faw,
                    size: 18),
                Text(
                  _isTelemedication ? "Telemedication" : "Clinic Appointment",
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ],
        ),
        elevation: 0,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BASBDateSelector(),
          BASBTimePicker(),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(
        label: Row(
          children: [
            Text(
              "Next",
              style: TextStyle(color: Colors.black),
            ),
            Icon(
              Icons.navigate_next,
              color: Colors.black,
            ),
          ],
        ),
        isExtended: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        onPressed: () {
          Navigator.of(context).pushNamed(VerifyAppointmentScreen.routeName);
        },
      ),
    );
  }
}
