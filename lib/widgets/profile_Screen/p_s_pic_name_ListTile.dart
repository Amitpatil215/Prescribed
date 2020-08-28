import 'package:flutter/material.dart';

class PSPicNameListTile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        maxRadius: 50,
        child: Text("Profile Pic"),
      ),
      title: Text(
        "Anubhav Bassi",
        style: TextStyle(
          fontSize: 20,
        ),
      ),
      subtitle: Text(
        "Sector,62 Noida",
      ),
    );
  }
}
