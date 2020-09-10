import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class PSPicNameListTile extends StatelessWidget {
  String userId;
  PSPicNameListTile(this.userId);
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection("user")
            .doc(userId)
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          final userData = snapshot.data.data();
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
              userData != null ? userData['name'] : "Your Name",
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            subtitle: Text(
              userData != null ? userData['location'] : "Current Location",
            ),
          );
        });
  }
}
