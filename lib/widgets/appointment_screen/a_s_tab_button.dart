import 'package:flutter/material.dart';
import 'package:doctor_duniya/widgets/appointment_screen/a_s_appointment_title.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ASTabButton extends StatefulWidget {
  @override
  _ASTabButtonState createState() => _ASTabButtonState();
}

class _ASTabButtonState extends State<ASTabButton> {
  var _isUpcoming = true;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RaisedButton(
              elevation: _isUpcoming ? 9 : 0,
              color: Colors.white,
              child: Container(
                width: _isUpcoming ? 200 : null,
                height: 30,
                child: Center(
                  child: Text(
                    "Upcoming",
                  ),
                ),
              ),
              onPressed: () {
                setState(() {
                  _isUpcoming = !_isUpcoming;
                });
              },
            ),
            RaisedButton(
              elevation: !_isUpcoming ? 9 : 0,
              color: Colors.white,
              child: Container(
                width: !_isUpcoming ? 200 : null,
                height: 30,
                child: Center(
                  child: Text("Past"),
                ),
              ),
              onPressed: () {
                setState(() {
                  _isUpcoming = !_isUpcoming;
                });
              },
            ),
          ],
        ),
        Container(
          height: 1580.h,
          child: ListView.builder(
            itemCount: 8,
            itemBuilder: (context, index) => ASAppointmentTile(),
          ),
        )
      ],
    );
  }
}
