import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import '../../screens/profile/availability_add_screen.dart';
import '../../Model/doctor.dart';

class PSAvailability extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var _userData = Provider.of<Doctor>(context);
    if (_userData != null) {
      var _isTeleAvailable =
          DateTime.now().isAfter(_userData.tfrom ?? DateTime.now()) &&
              DateTime.now().isBefore(_userData.tto ?? DateTime.now());

      var _isCliAvailable =
          DateTime.now().isAfter(_userData.cfrom ?? DateTime.now()) &&
              DateTime.now().isBefore(_userData.cto ?? DateTime.now());

      return Container(
        height: 150.h,
        margin: EdgeInsets.symmetric(horizontal: 22),
        padding: EdgeInsets.symmetric(horizontal: 7),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.only(top: 10),
                    child: Text(
                      "Availability",
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  if (_userData.tfrom == null &&
                      _userData.tto == null &&
                      _userData.cfrom == null &&
                      _userData.cto == null)
                    Text(
                      "Your Telemedication, Clinic\n time slots appear here!",
                    ),
                  if (_userData.tfrom != null ||
                      _userData.tto != null ||
                      _userData.cfrom != null ||
                      _userData.cto != null)
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Currently Online",
                          style: TextStyle(fontSize: 16),
                        ),
                        SizedBox(height: 5),
                        Row(
                          children: [
                            if (_isTeleAvailable) Icon(FlutterIcons.call_mdi),
                            if (_isCliAvailable)
                              Icon(FlutterIcons.hospital_faw5),
                          ],
                        ),
                        Text(
                          "Currently Offline",
                          style: TextStyle(fontSize: 16),
                        ),
                        SizedBox(height: 5),
                        Row(
                          children: [
                            if (!_isTeleAvailable) Icon(FlutterIcons.call_mdi),
                            if (!_isCliAvailable)
                              Icon(FlutterIcons.hospital_faw5),
                          ],
                        ),
                      ],
                    )
                ],
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  child: Icon(
                    FlutterIcons.event_available_mdi,
                    size: 30,
                    color: Colors.deepPurple,
                  ),
                ),
                OutlineButton.icon(
                  icon: Icon(Icons.add),
                  label: Text("Add"),
                  onPressed: () {
                    Navigator.of(context)
                        .pushNamed(AvailabilityAddScreen.routName);
                  },
                )
              ],
            )
          ],
        ),
      );
    } else {
      return CircularProgressIndicator();
    }
  }
}
