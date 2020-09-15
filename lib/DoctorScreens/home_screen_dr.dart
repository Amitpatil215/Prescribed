import 'package:flutter/material.dart';

class HomeScreenDR extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        title: Text("Dr Home Screen"),
      ),
    );
  }
}
