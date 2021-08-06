import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'widgets/h_s_gridview.dart';
import 'widgets/h_s_listView.dart';
import 'widgets/h_s_helpButton.dart';
import '../See_all_categories/categories_see_all_screen.dart';
import '../See_all_top_doctors/top_doctors_see_all_screen.dart';
import 'widgets/h_s_profilePic.dart';
import 'widgets/h_s_promo_cards.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    Row(
                      children: [
                        Icon(
                          FlutterIcons.heartbeat_faw,
                          color: Colors.deepPurple,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          "Prescribed Health",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w300,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                    Spacer(),
                    HSProfilePic(),
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
              HSPromoCards(),
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
