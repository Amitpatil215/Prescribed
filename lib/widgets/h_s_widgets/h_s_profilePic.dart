import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import '../../Model/doctor.dart';
import '../../Model/patient.dart';
import '../../Model/userType.dart';
import '../../screens/profile/profile_screen.dart';

class HSProfilePic extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var _isPatient = Provider.of<UserType>(context).isPatient;
    var _userData;
    if (_isPatient) {
      _userData = Provider.of<Patient>(context, listen: true);
    } else {
      _userData = Provider.of<Doctor>(context, listen: true);
    }
    return GestureDetector(
      child: CircleAvatar(
        maxRadius: 12.h,
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
      onTap: () {
        Navigator.of(context).pushNamed(ProfileScreen.rountName);
      },
    );
  }
}
