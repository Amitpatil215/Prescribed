import 'package:doctor_duniya/screens/profile/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../widgets/d_s_widgets/d_s_progress_card_widget.dart';

class HomeScreenDR extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              backgroundColor: !innerBoxIsScrolled
                  ? Colors.white.withOpacity(0)
                  : Colors.white.withOpacity(0.9),
              expandedHeight: 0.2.hp,
              pinned: true,
              elevation: 0,
              floating: true,
              flexibleSpace: FlexibleSpaceBar(
                titlePadding: EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 10,
                ),
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(
                      FlutterIcons.heartbeat_faw,
                      color: Colors.deepPurple,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      "Doctor Duniya",
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w300,
                        color: Colors.black,
                      ),
                    ),
                    Spacer(),
                    GestureDetector(
                      child: CircleAvatar(
                        maxRadius: 12.h,
                        child: Hero(
                          tag: "ProfileHeroKey",
                          child: SvgPicture.asset(
                            "assets/images/male.svg",
                          ),
                        ),
                      ),
                      onTap: () {
                        Navigator.of(context)
                            .pushNamed(ProfileScreen.rountName);
                      },
                    ),
                  ],
                ),
              ),
            ),
          ];
        },
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(
                height: 8,
              ),
              DSProgressCard(),
              // Padding(
              //   padding: EdgeInsets.only(
              //     left: 10.0,
              //     right: 20.0,
              //   ),
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //     children: [
              //       Text(
              //         "Upcoming Clicic Appointment",
              //         style: TextStyle(
              //           fontSize: 15,
              //           fontWeight: FontWeight.bold,
              //         ),
              //       ),
              //     ],
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
