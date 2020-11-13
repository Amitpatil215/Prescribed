import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../widgets/colors.dart';
import 'package:flutter/material.dart';

class RequestedReviewScreen extends StatelessWidget {
  static const routeName = 'requested-review';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        elevation: 0,
        title: Text("Review appointment #326"),
        backgroundColor: appBarColor,
      ),
      body: SingleChildScrollView(
        child: Container(
          height: 1.hp - 120,
          padding: EdgeInsets.symmetric(horizontal: 10),
          margin: EdgeInsets.symmetric(vertical: 1.h, horizontal: 7.w),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 130.h,
                    width: 100.w,
                    child: SvgPicture.asset(
                      "assets/images/profile.svg",
                      height: 140.h,
                      width: 90.w,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(
                      horizontal: 10.w,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Rajesh Kumar",
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                        Text(
                          '18 yrs ',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                          ),
                        ),
                        Text(
                          'Male',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                        Text(
                          'Booked few hours ago',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w300,
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
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
                          "November 26",
                          // "${DateFormat('MMMM, d').format(_appointmentDate)}",
                          style: TextStyle(
                              fontSize: 25, fontWeight: FontWeight.w400),
                        ),
                        Text(
                          "Monday, 11 : 30 PM",
                          //"${DateFormat('EEEE, h:mm a').format(_appointmentDate)}",
                          style: TextStyle(fontSize: 20),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10),
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
                          "Telemedication",
                          style: TextStyle(fontSize: 15),
                        ),
                        Text(
                          "₹ 400",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
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
                          "On accepting appointment patients details appear here!",
                          style: TextStyle(fontSize: 16, color: Colors.grey),
                        ),
                        SizedBox(height: 7),
                        Row(
                          children: [
                            Icon(Icons.timer),
                            SizedBox(width: 7),
                            Text(
                              "15 mins remaining",
                              style:
                                  TextStyle(fontSize: 18, color: Colors.grey),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: OutlineButton.icon(
                      onPressed: () {},
                      icon: Icon(FlutterIcons.cross_ent),
                      color: Colors.white60,
                      label: Text(
                        "Cancel",
                        style: TextStyle(fontSize: 17),
                      ),
                    ),
                  ),
                  SizedBox(width: 20),
                  Expanded(
                    child: OutlineButton.icon(
                      onPressed: () {},
                      icon: Icon(Icons.check),
                      color: Colors.white60,
                      label: Text(
                        "Accept",
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 17),
              Row(
                children: [
                  Text(
                    "See what happens when you cancel the ",
                    style: TextStyle(color: Colors.grey),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text("Appointment?"),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
