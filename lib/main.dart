import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'providers/auth_user_provider.dart';
import 'screens/DoctorScreens/home_screen_dr.dart';
import 'Model/userType.dart';
import 'screens/auth_screen.dart';
import 'screens/home/home_screen.dart';
import 'main_properties/m_p_route_table.dart';
import 'main_properties/m_p_base_theme.dart';
import 'main_properties/m_p_provider_list.dart';

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
      providers: mPProviderList,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: mPBaseTheme,
        home: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            ScreenUtil.init(
              context,
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
            );
            if (snapshot.hasData) {
              var userType = Provider.of<UserType>(context);
              if (userType == null) {
                return CircularProgressIndicator();
              } else {
                Provider.of<AuthUser>(context)
                    .setUserTypeIsPatient(userType.isPatient);
                if (userType.isPatient) {
                  return HomeScreen();
                } else {
                  return HomeScreenDR();
                }
              }
            } else {
              return AuthScreen();
            }
          },
        ),
        routes: mPRouteTable,
      ),
    );
  }
}
