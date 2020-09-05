import 'package:doctor_duniya/screens/doctor_know_more_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HSListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 5,
      itemBuilder: (context, index) {
        return Column(
          children: [
            GestureDetector(
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 30.w),
                width: double.infinity,
                decoration: BoxDecoration(
                  boxShadow: [BoxShadow(color: Colors.grey, blurRadius: 8)],
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                padding: EdgeInsets.all(0),
                child: Row(
                  children: [
                    Container(
                      height: 130,
                      width: 180.h,
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Dr. Shashikant Chaturvedhi",
                            style: TextStyle(
                              fontSize: 18,
                            ),
                          ),
                          RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(children: <TextSpan>[
                              TextSpan(
                                text: 'Psychiatrist',
                                style: TextStyle(color: Colors.black),
                              ),
                              TextSpan(
                                text: '  (MBBS,MD)',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w300),
                              ),
                            ]),
                          ),
                          RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(children: <TextSpan>[
                              TextSpan(
                                text: 'Knows',
                                style: TextStyle(color: Colors.blue),
                              ),
                              TextSpan(
                                text: '  Hindi, English, Marathi',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w300),
                              ),
                            ]),
                          ),
                          RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(
                              children: <TextSpan>[
                                TextSpan(
                                  text: '₹ 400',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                    color: Colors.black,
                                  ),
                                ),
                                TextSpan(
                                  text: ' (Save 20%)',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w300),
                                ),
                              ],
                            ),
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.add_circle,
                                size: 15,
                              ),
                              Text("  Nishank Hospital")
                            ],
                          ),
                          Row(
                            children: [
                              OutlineButton(
                                child: Container(
                                  width: 90,
                                  child: Center(
                                    child: Text(
                                      "Know More",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                                color: Colors.purple.withOpacity(0.80),
                                onPressed: () {
                                  Navigator.of(context)
                                      .pushNamed(DoctorKnowMoreScreen.routName);
                                },
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              OutlineButton(
                                child: Container(
                                  width: 110,
                                  child: Center(
                                    child: Text(
                                      "Consult Now",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.blue),
                                    ),
                                  ),
                                ),
                                color: Colors.blueAccent.withOpacity(0.50),
                                onPressed: () {},
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              onTap: () {
                Navigator.of(context).pushNamed(DoctorKnowMoreScreen.routName);
              },
            ),
            SizedBox(
              height: 10,
            ),
          ],
        );
      },
    );
  }
}
