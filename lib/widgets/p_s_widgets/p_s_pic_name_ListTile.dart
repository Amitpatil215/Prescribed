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
      _userData = Provider.of<Doctor>(context, listen: true);
    }

    return ListTile(
      leading: CircleAvatar(
        maxRadius: 70,
        child: Hero(
          tag: "ProfileHeroKey",
          child: ClipOval(
            child: _userData.profileImageUrl == null
                ? SvgPicture.asset(
                    "assets/images/male.svg",
                  )
                : Image.network(
                    "${_userData.profileImageUrl}",
                  ),
          ),
        ),
      ),
      title: _userData != null
          ? Text(
              _userData.name ?? "Your Name",
              style: TextStyle(
                fontSize: 20,
              ),
            )
          : CircularProgressIndicator(),
      subtitle: _userData != null
          ? Text(
              _userData.address ?? "Current Location",
            )
          : CircularProgressIndicator(),
    );
  }
}
