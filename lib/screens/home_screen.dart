import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("HomeScreen"),
      ),
      body: Container(
        child: Center(
          child: Text(
            "we implementing \n main Screen here",
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.w200),
          ),
        ),
      ),
    );
  }
}
