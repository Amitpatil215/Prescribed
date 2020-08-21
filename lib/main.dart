import 'package:flutter/material.dart';

import 'screens/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
      theme: ThemeData(
          fontFamily: 'Glaciallndifference',
          primarySwatch: Colors.blue,
          errorColor: Colors.red,
          accentColor: Colors.blueAccent),
    );
  }
}
