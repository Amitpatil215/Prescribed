import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import '../../widgets/b_a_widgets/b_a_s_b_date_selector.dart';
import '../../widgets/b_a_widgets/b_a_s_b_time_picker.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SlotBookScreen extends StatelessWidget {
  static const routeName = 'slot-book';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Dr. Shashikant Chaturvedhi"),
            Row(
              children: [
                Icon(FlutterIcons.phone_faw, size: 18),
                Text(
                  "Telemedication",
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
        onPressed: () {},
      ),
    );
  }
}
