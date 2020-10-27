import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import '../../widgets/appoint_s_widgets/appoint_s_Tab_Bar.dart';

class AppointmentScreen extends StatelessWidget {
  static const routName = '/appointment';
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        appBar: AppBar(
          title: Text(
            "My Appointments",
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          backgroundColor: Theme.of(context).backgroundColor,
          elevation: 0,
          bottom: TabBar(
            labelColor: Colors.black,
            tabs: [
              Tab(
                text: "Upcoming",
              ),
              Tab(
                text: "Previous",
              ),
            ],
          ),
        ),
        body: AppointSTabBar(),
      ),
    );
  }
}
