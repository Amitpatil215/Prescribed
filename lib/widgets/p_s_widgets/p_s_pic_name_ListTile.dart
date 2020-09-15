import 'package:doctor_duniya/Model/doctor.dart';
import 'package:doctor_duniya/Model/userType.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import '../../Model/patient.dart';

class PSPicNameListTile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var _isPatient = Provider.of<UserType>(context).isPatient;
    var _userData;
    if (_isPatient) {
      _userData = Provider.of<Patient>(context, listen: true);
    } else {
      print("Doctor wala running");
      _userData = Provider.of<Doctor>(context, listen: true);
    }

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
