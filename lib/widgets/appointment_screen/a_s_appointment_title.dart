import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';

class ASAppointmentTile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: Row(
        children: [
          Column(
            children: [
              Text(
                "25 \nSept",
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.w300,
                ),
              ),
            ],
          ),
          Column(
            children: [
              Container(
                height: 125,
                width: ScreenUtil().setWidth(850),
                margin: EdgeInsets.only(left: ScreenUtil().setWidth(30)),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                top: 8.0,
                                left: 9,
                              ),
                              child: Text(
                                "7:30 PM",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blue,
                                ),
                              ),
                            ),
                            Text(
                              "2 h 30 min",
                              style: TextStyle(
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Column(
                          children: [
                            Text(
                              "Meeting with Dr. Duva",
                              style: TextStyle(
                                fontSize: 18,
                              ),
                            ),
                            Container(
                              width: ScreenUtil().setHeight(500),
                              child: Row(
                                children: [
                                  Icon(Icons.location_on),
                                  Expanded(
                                    child: Text(
                                      "Indira gandhi international airport",
                                      overflow: TextOverflow.ellipsis,
                                      softWrap: false,
                                      maxLines: 1,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 5),
                              width: ScreenUtil().setHeight(500),
                              child: Row(
                                children: [
                                  Icon(Icons.phone),
                                  Text(
                                    "Telecomunication",
                                    overflow: TextOverflow.ellipsis,
                                    softWrap: false,
                                    maxLines: 1,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Spacer(),
                    Card(
                      child: Text("Add buttons here"),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
