import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import '../widgets/h_s_searchBar.dart';
import '../widgets/h_s_gridview.dart';
import '../widgets/h_s_listView.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            width: double.infinity,
            margin: EdgeInsets.symmetric(vertical: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: Icon(Icons.more_horiz),
                  onPressed: () {},
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: GestureDetector(
                    child: CircleAvatar(),
                    onTap: () {},
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
          HSSearchBar(),
          Padding(
            padding: EdgeInsets.only(left: 10.0),
            child: Text(
              "Categories",
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
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
          Padding(
            padding: EdgeInsets.only(left: 10.0),
            child: Text(
              "Top Doctors",
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(
            height: 8,
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.46,
            child: HSListView(),
          ),
        ],
      ),
    );
  }
}
