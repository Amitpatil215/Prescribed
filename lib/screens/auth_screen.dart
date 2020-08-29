import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import '../widgets/auth_screen/a_s_authForm.dart';
import '../widgets/auth_screen/a_s_login_image.dart';
import '../widgets/auth_screen/a_s_type_button.dart';

class AuthScreen extends StatelessWidget {
  static const routName = "/auth-screen";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(top: ScreenUtil.screenHeight * 0.15),
          child: Column(
            children: [
              Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  ASLoginImage(),
                  ASTypeButton(),
                ],
              ),
              ASAuthForm(),
            ],
          ),
        ),
      ),
    );
  }
}
