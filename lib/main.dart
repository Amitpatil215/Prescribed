import 'package:doctor_duniya/Model/patient.dart';
import 'package:doctor_duniya/providers/patient_profile_provider.dart';
import 'package:doctor_duniya/screens/profile/health_measure_add_screen.dart';
import 'package:doctor_duniya/screens/profile/profile_edit_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'providers/auth_user_provider.dart';
import 'screens/auth_screen.dart';
import 'screens/home/home_screen.dart';
import 'screens/profile/profile_screen.dart';
import 'screens/profile/appointment_screen.dart';
import 'screens/home/categories_see_all_screen.dart';
import 'screens/home/top_doctors_see_all_screen.dart';
import 'screens/medicine/prescribe_medicine_screen.dart';
import 'screens/medicine/add_medicine.dart';
import 'screens/doctor_know_more_screen.dart';
import 'screens/book_appointment/book_appointment_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      systemNavigationBarColor:
          Colors.white.withOpacity(0), // navigation bar color
      statusBarColor: Colors.white.withOpacity(0), // status bar color
      statusBarIconBrightness: Brightness.dark,
      systemNavigationBarIconBrightness: Brightness.dark));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: AuthUser(),
        ),
        StreamProvider<Patient>.value(
          value: PatientProfileProvider().patientData(),
        ),
        ChangeNotifierProvider.value(
          value: PatientProfileProvider(),
        ),
        ChangeNotifierProvider.value(
          value: PatientProfileProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
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
          cardTheme: CardTheme(
            elevation: 5,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            margin: EdgeInsets.symmetric(vertical: 10),
          ),
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
            ScreenUtil.init(
              context,
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
            );
            if (snapshot.hasData) {
              
              return HomeScreen();
            } else {
              return AuthScreen();
            }
          },
        ),
        routes: {
          AuthScreen.routName: (ctx) {
            return AuthScreen();
          },
          CatergoriesSeeAllScreen.routName: (ctx) {
            return CatergoriesSeeAllScreen();
          },
          TopDoctorsSeeAllScreen.routeName: (ctx) {
            return TopDoctorsSeeAllScreen();
          },
          ProfileScreen.rountName: (ctx) {
            return ProfileScreen();
          },
          DoctorKnowMoreScreen.routName: (ctx) {
            return DoctorKnowMoreScreen();
          },
          BookAppointmentScreen.routName: (ctx) {
            return BookAppointmentScreen();
          },
          AppointmentScreen.routName: (ctx) {
            return AppointmentScreen();
          },
          PrescribeMedicineButton.routName: (ctx) {
            return PrescribeMedicineButton();
          },
          AddMedicine.routeName: (ctx) {
            return AddMedicine();
          },
          ProfileEditScreen.routName: (ctx) {
            return ProfileEditScreen();
          },
          HealthMeasureAddScreen.routeName: (ctx) {
            return HealthMeasureAddScreen();
          }
        },
      ),
    );
  }
}
