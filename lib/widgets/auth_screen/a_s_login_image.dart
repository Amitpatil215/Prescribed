import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ASLoginImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: SvgPicture.asset(
        "assets/images/login.svg",
        height: 400,
        width: 100,
      ),
    );
  }
}
