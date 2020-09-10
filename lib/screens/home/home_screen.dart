import 'package:doctor_duniya/screens/profile/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../widgets/h_s_widgets/h_s_gridview.dart';
import '../../widgets/h_s_widgets/h_s_listView.dart';
import '../../widgets/h_s_widgets/h_s_helpButton.dart';
import '../../screens/home/categories_see_all_screen.dart';
import '../../screens/home/top_doctors_see_all_screen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.white,
      floatingActionButton: FloatingActionButton(
          elevation: 9,
          backgroundColor: Colors.white,
          child: Icon(
            Icons.search,
            color: Colors.black,
            size: 30,
          ),
          onPressed: () {}),
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
              Padding(
                padding: EdgeInsets.only(
                  left: 10.0,
                  right: 20.0,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Categories",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    InkWell(
                      child: Text(
                        "See All",
                        style: TextStyle(
                          fontSize: 14,
                          color: Theme.of(context).accentColor,
                        ),
                      ),
                      onTap: () {
                        Navigator.of(context)
                            .pushNamed(CatergoriesSeeAllScreen.routName);
                      },
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(
                  vertical: 20,
                  horizontal: 10,
                ),
                height: 120,
                width: double.infinity,
                child: HSGridView(),
              ),
              SizedBox(
                height: 8,
              ),
              Padding(
                padding: EdgeInsets.only(left: 10.0),
                child: Text(
                  "How can we help you?",
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              HSHelpButton(),
              SizedBox(
                height: 8,
              ),
              Padding(
                padding: EdgeInsets.only(left: 10.0, right: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Top Doctors",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    InkWell(
                      child: Text(
                        "See All",
                        style: TextStyle(
                          fontSize: 14,
                          color: Theme.of(context).accentColor,
                        ),
                      ),
                      onTap: () {
                        Navigator.of(context)
                            .pushNamed(TopDoctorsSeeAllScreen.routeName);
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              HSListView(),
            ],
          ),
        ),
      ),
    );
  }
}
