import 'package:flutter/material.dart';
import '../widgets/auth_screen/a_s_authForm.dart';
import '../widgets/auth_screen/a_s_login_image.dart';

class AuthScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: Container(
          child: SingleChildScrollView(
        child: Column(
          children: [
            ASLoginImage(),
            ASAuthForm(),
          ],
        ),
      )),
    );
  }
}
