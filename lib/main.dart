import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
          textTheme: GoogleFonts.robotoSlabTextTheme(
            Theme.of(context).textTheme,
          ),
          primarySwatch: Colors.blue,
          errorColor: Colors.red,
          accentColor: Colors.blueAccent),
    );
  }
}
