import 'package:doctor_duniya/providers/select_DateTimeType_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class BAVSAppointmentDetailsCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var _isTelemedication =
        Provider.of<SelectDateTimeTypeProvider>(context).fetchAppointTypeIsTele;
    var _appointmentDate =
        Provider.of<SelectDateTimeTypeProvider>(context).fetchAppointmentDate;
    return Column(
      
      children: [
        Container(
          width: 350.w,
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            border: Border.all(color: Colors.grey, width: 0.5),
          ),
          child: Column(
            children: [
              Text(
                "Dr. Shashikant Chkraborty",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              Text(
                // "November 26",
                "${DateFormat('MMMM, d').format(_appointmentDate)}",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.w400),
              ),
              Text(
                "${DateFormat('EEEE, h:mm a').format(_appointmentDate)}",
                style: TextStyle(fontSize: 20),
              ),
            ],
          ),
        ),
        SizedBox(height: 7),
        Container(
          width: 350.w,
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            border: Border.all(color: Colors.grey, width: 0.5),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(
                FlutterIcons.call_mdi,
                size: 20,
              ),
              Text(
                _isTelemedication ? "Telemedication" : "Clinic Counsultation",
                style: TextStyle(fontSize: 15),
              ),
              Text(
                "₹ 400",
                style: TextStyle(fontWeight: FontWeight.bold),
              )
            ],
          ),
        ),
      ],
    );
  }
}
