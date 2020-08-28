import 'package:flutter/material.dart';

class PSEmailPhoneCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
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
            );
  }
}
