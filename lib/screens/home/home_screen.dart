import 'package:doctor_duniya/screens/profile/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import '../../widgets/h_s_widgets/h_s_gridview.dart';
import '../../widgets/h_s_widgets/h_s_listView.dart';
import '../../widgets/h_s_widgets/h_s_helpButton.dart';
import '../../screens/home/categories_see_all_screen.dart';
import '../../screens/home/top_doctors_see_all_screen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      floatingActionButton: FloatingActionButton(
          elevation: 9,
          backgroundColor: Colors.white,
          child: Icon(
            Icons.search,
            color: Colors.black,
            size: 30,
          ),
          onPressed: () {}),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            width: double.infinity,
            margin: EdgeInsets.symmetric(vertical: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text("Clinic near"),
                      FlatButton.icon(
                        onPressed: () {},
                        icon: Icon(Icons.location_on),
                        label: Text("Pune"),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: GestureDetector(
                    child: CircleAvatar(),
                    onTap: () {
                      Navigator.of(context).pushNamed(ProfileScreen.rountName);
                    },
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 8.0),
            child: Text(
              "Appointment with \n a doctor",
              textAlign: TextAlign.left,
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
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
              )),
          Expanded(
            child: Container(
              //color: Colors.white,
              height: 600,
              child: HSListView(),
            ),
          ),
        ],
      ),
    );
  }
}
