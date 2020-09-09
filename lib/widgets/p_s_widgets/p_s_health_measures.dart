import 'package:doctor_duniya/screens/profile/health_measure_add_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PSHealthMeasures extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
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
                    "Health Measures",
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                ),
                SizedBox(height: 10),
                // Text(
                //   "Helath Parameters like Blodd Sugar,\n Presure appears here",
                // ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Presure : 120 mm/Hg"),
                    Text("Sugar : 300"),
                    Text("Heart Rate : 98 b/min"),
                    Text(
                      "Allergy :",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                    ),
                    ConstrainedBox(
                      constraints: BoxConstraints(
                        maxWidth: 0.6.wp,
                      ),
                      child: Text(
                        "Dust allergy, Sour throt problem freqently,worjdvbsj cdsb ervifub vdisbu wvrbi",
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                    )
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
                  FlutterIcons.heartbeat_faw,
                  size: 30,
                  color: Colors.deepPurple,
                ),
              ),
              OutlineButton.icon(
                icon: Icon(Icons.add),
                label: Text("Add"),
                onPressed: () {
                  Navigator.of(context)
                      .pushNamed(HealthMeasureAddScreen.routeName);
                },
              )
            ],
          )
        ],
      ),
    );
  }
}
