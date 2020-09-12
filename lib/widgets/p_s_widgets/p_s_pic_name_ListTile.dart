import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import '../../Model/patient.dart';

class PSPicNameListTile extends StatelessWidget {
  String userId;
  PSPicNameListTile(this.userId);
  @override
  Widget build(BuildContext context) {
    final _userData = Provider.of<Patient>(context, listen: true);
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
        _userData.location.address != null
            ? _userData.location.address
            : "Current Location",
      ),
    );
  }
}
