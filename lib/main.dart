import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'screens/auth_screen.dart';
import 'screens/home_screen.dart';
import 'screens/profile_screen.dart';
import 'screens/appointment_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      systemNavigationBarColor:
          Colors.white.withOpacity(0.95), // navigation bar color
      statusBarColor: Colors.white.withOpacity(0.95), // status bar color
      statusBarIconBrightness: Brightness.dark,
      systemNavigationBarIconBrightness: Brightness.dark));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'ProductSans',
        backgroundColor: Colors.white.withOpacity(0.95),
        primarySwatch: Colors.blue,
        errorColor: Colors.red,
        accentColor: Colors.blueAccent,
        buttonColor: Colors.white,
        iconTheme: IconThemeData(opacity: 0.6),
        buttonTheme: ButtonTheme.of(context).copyWith(
          buttonColor: Colors.pink,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18),
          ),
        ),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return HomeScreen();
          } else {
            return AuthScreen();
          }
        },
      ),
      routes: {
        ProfileScreen.rountName: (ctx) {
          return ProfileScreen();
        },
        AppointmentScreen.routName: (ctx) {
          return AppointmentScreen();
        }
      },
    );
  }
}
