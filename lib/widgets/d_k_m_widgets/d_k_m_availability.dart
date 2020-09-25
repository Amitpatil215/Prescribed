import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ! Do change time to date time
// * at time of passing data
class DKMAvailability extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        AvailabilityTile(
          title: "Telemedication",
          time: "02:00 PM - 04:00 PM",
        ),
        SizedBox(width: 7.w),
        AvailabilityTile(
          title: "Clinic Consultation",
          time: "06:00 PM - 10:00 PM",
        ),
      ],
    );
  }
}

class AvailabilityTile extends StatelessWidget {
  final String title;
  final String time;

  AvailabilityTile({
    Key key,
    this.time,
    this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(7),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          children: [
            Text(title),
            SizedBox(height: 5),
            Text(time),
          ],
        ),
      ),
    );
  }
}
