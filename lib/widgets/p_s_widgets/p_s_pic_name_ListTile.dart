import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

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
              child: Text("Profile Pic"),
            ),
            title: Text(
              userData['name'],
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            subtitle: Text(
              "Noida Sector 62",
            ),
          );
        });
  }
}
