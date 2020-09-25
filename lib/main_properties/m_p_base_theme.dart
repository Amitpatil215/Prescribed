import 'package:flutter/material.dart';

ThemeData mPBaseTheme = ThemeData(
  fontFamily: 'ProductSans',
  backgroundColor: Colors.white.withOpacity(0.97),
  scaffoldBackgroundColor: Colors.white.withOpacity(0.97),
  primarySwatch: Colors.blue,
  errorColor: Colors.red,
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    backgroundColor: Colors.white,
  ),
  appBarTheme: AppBarTheme(
    color: Colors.white,
    brightness: Brightness.light,
    iconTheme: IconThemeData(
      color: Colors.black,
    ),
    textTheme: TextTheme(
      headline6: TextStyle(
        color: Colors.black,
        fontSize: 20,
        fontWeight: FontWeight.w300,
      ),
    ),
  ),
  buttonTheme: ButtonThemeData(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(30),
    ),
  ),
  cardTheme: CardTheme(
    elevation: 5,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    margin: EdgeInsets.symmetric(vertical: 10),
  ),
  accentColor: Colors.blueAccent,
  buttonColor: Colors.white,
  iconTheme: IconThemeData(opacity: 0.6),
  visualDensity: VisualDensity.adaptivePlatformDensity,
);
