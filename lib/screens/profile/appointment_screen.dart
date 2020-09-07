import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import '../../widgets/appoint_s_widgets/appoint_s_tab_button.dart';

class AppointmentScreen extends StatelessWidget {
  static const routName = '/appointment';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        title: Text(
          "My Appointments",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        backgroundColor: Theme.of(context).backgroundColor,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: SingleChildScrollView(child: ASTabButton()),
    );
  }
}
