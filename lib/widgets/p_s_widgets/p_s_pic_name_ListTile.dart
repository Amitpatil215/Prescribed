import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import '../../Model/patient.dart';

class PSPicNameListTile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var _userData = Provider.of<Patient>(context, listen: true);
    print(_userData);

    return ListTile(
      leading: CircleAvatar(
        maxRadius: 50,
        child: Hero(
          tag: "ProfileHeroKey",
          child: SvgPicture.asset(
            "assets/images/male.svg",
          ),
        ),
      ),
      title: Text(
        _userData.name != null ? _userData.name : "Your Name",
        style: TextStyle(
          fontSize: 20,
        ),
      ),
      subtitle: Text(
        _userData.phone != null
            ? _userData.location.address ?? "Current Location"
            : "Current Location",
      ),
    );
  }
}
