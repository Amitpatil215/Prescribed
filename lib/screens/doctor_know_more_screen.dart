import 'package:flutter/material.dart';

class DoctorKnowMoreScreen extends StatelessWidget {
  static const routName = "know-doctor";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        title: Text("Dr. Shikant Chaturvedhi"),
      ),
    );
  }
}
