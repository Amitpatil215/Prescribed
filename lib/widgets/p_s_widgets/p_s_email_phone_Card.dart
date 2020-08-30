import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:doctor_duniya/screens/profile/profile_edit_screen.dart';

class PSEmailPhoneCard extends StatelessWidget {
  String userId;
  PSEmailPhoneCard(this.userId);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 2, horizontal: 40),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          StreamBuilder(
              stream: FirebaseFirestore.instance
                  .collection("user")
                  .doc(userId)
                  .snapshots(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return CircularProgressIndicator();
                }
                final userData = snapshot.data.data();
                return Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.email),
                        SizedBox(
                          width: 10,
                        ),
                        Text(userData['email']),
                      ],
                    ),
                    SizedBox(
                      height: 2,
                    ),
                    Row(
                      children: [
                        Icon(Icons.phone_android),
                        SizedBox(
                          width: 10,
                        ),
                        Text(userData['phone'].toString()),
                      ],
                    ),
                  ],
                );
              }),
          OutlineButton.icon(
            icon: Icon(Icons.edit),
            label: Text("Edit"),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            onPressed: () {
              Navigator.of(context).pushNamed(ProfileEditScreen.routName);
            },
          )
        ],
      ),
    );
  }
}
