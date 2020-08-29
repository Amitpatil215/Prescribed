import 'package:flutter/material.dart';

class ProfileEditScreen extends StatelessWidget {
  static const routName = '/profile-edit';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        appBar: AppBar(
          title: Text("Edit Profille"),
        ),
        body: Container(
          margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          child: Column(
            children: [
              EachFormTile(
                hintText: "e.g. Zakir Khan",
                iconRecieved: Icons.person,
                labelText: "Your Full Name",
              ),
              EachFormTile(
                hintText: "e.g. Zakir Khan",
                iconRecieved: null,
                labelText: "Gender",
              ),
              EachFormTile(
                hintText: "e.g. Noida",
                iconRecieved: Icons.location_on,
                labelText: "Home Location",
              ),
              EachFormTile(
                hintText: "e.g. +91 1234567890",
                iconRecieved: Icons.call,
                labelText: "Contact Number",
              ),
              EachFormTile(
                hintText: "e.g. doctorDuniya@gmail.com",
                iconRecieved: Icons.email,
                labelText: "Email",
              ),
            ],
          ),
        ));
  }
}

class EachFormTile extends StatelessWidget {
  final String labelText;
  final IconData iconRecieved;
  final String hintText;

  EachFormTile({
    Key key,
    this.labelText,
    this.iconRecieved,
    this.hintText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.symmetric(vertical: 10),
            child: Row(
              children: [
                Icon(
                  iconRecieved,
                  size: 30,
                ),
                SizedBox(
                  width: 15,
                ),
                Expanded(
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: hintText,
                      labelText: labelText,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
