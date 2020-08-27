import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  static const rountName = '/profile';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.symmetric(vertical: 30),
        child: Column(
          children: [
            Container(
              color: Colors.white54,
              margin: EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: Icon(Icons.arrow_back),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: Icon(Icons.settings),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
            ListTile(
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
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 2, horizontal: 40),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.email),
                          SizedBox(
                            width: 10,
                          ),
                          Text("anubhavsingh21@gmail.com"),
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
                          Text("+91 1234567890"),
                        ],
                      ),
                    ],
                  ),
                  OutlineButton.icon(
                    icon: Icon(Icons.edit),
                    label: Text("Edit"),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    onPressed: () {},
                  )
                ],
              ),
            ),
            Container(
                color: Colors.yellow,
                height: 150,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Text("Health Data"),
                      ],
                    )
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
