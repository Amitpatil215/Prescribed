import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DSRecentlyRequested extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: ListView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: 5,
        itemBuilder: (context, index) => Column(
          children: [
            ListTile(
              leading: CircleAvatar(
                radius: 30,
                child: SvgPicture.asset(
                  "assets/images/profile.svg",
                  height: 140.h,
                  width: 90.w,
                ),
                backgroundColor: Colors.transparent,
              ),
              title: Text("John Mishra"),
              subtitle: Row(
                children: [
                  Icon(
                    // Todo: Dynamically fetch call or hospital icon acc. to appointment type
                    Icons.call,
                    size: 15,
                  ),
                  Text(" 24 Oct 20 - 02:30 PM"),
                ],
              ),
              trailing: Icon(Icons.navigate_next),
              onTap: () {},
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
            ),
            Divider(
              indent: 0.20.wp,
              color: Colors.grey,
            ),
          ],
        ),
      ),
    );
  }
}
