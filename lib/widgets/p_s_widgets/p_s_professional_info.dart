import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../screens/profile/professional_info_add_screen.dart';
import '../../Model/doctor.dart';

class PSProfessionalInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var _userData = Provider.of<Doctor>(context, listen: true);
    return Container(
      constraints: BoxConstraints(
        minHeight: 150.h,
      ),
      margin: EdgeInsets.symmetric(horizontal: 22),
      padding: EdgeInsets.symmetric(horizontal: 7),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _userData == null
              ? CircularProgressIndicator()
              : Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: EdgeInsets.only(top: 10),
                        child: Text(
                          "Professional Information",
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      if (_userData.field == null &&
                          _userData.degree == null &&
                          _userData.experience == null &&
                          _userData.language == null &&
                          _userData.moreDetails == null &&
                          _userData.university == null)
                        Text(
                          "Information like Education, Language, \n Degree appears here",
                        ),
                      if (_userData.field != null ||
                          _userData.degree != null ||
                          _userData.experience != null ||
                          _userData.moreDetails != null ||
                          _userData.university != null ||
                          _userData.language != null)
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Domain :${_userData.field ?? "0.0"} "),
                            Text(
                                "Degree : ${_userData.degree ?? "Not Available"}"),
                            Text(
                                "Experience : ${_userData.experience ?? "Not Available"} Yrs"),
                            Text(
                                "University : ${_userData.university ?? "Not Available"} "),
                            Text(
                                "Languages : ${_userData.language ?? "Not Available"}"),
                            Text(
                              "Info :",
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w600),
                            ),
                            ConstrainedBox(
                              constraints: BoxConstraints(
                                maxWidth: 0.6.wp,
                              ),
                              child: Text(
                                _userData.moreDetails ??
                                    "More Details Appear Here",
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                              ),
                            )
                          ],
                        )
                    ],
                  ),
                ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                child: Icon(
                  FlutterIcons.profile_ant,
                  size: 30,
                  color: Colors.deepPurple,
                ),
              ),
              OutlineButton.icon(
                icon: Icon(Icons.add),
                label: Text("Add"),
                onPressed: () {
                  Navigator.of(context)
                      .pushNamed(ProfessionalInfoAddScreen.routName);
                },
              )
            ],
          )
        ],
      ),
    );
  }
}
