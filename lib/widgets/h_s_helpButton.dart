import 'package:flutter/material.dart';

class HSHelpButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        EachButton(
          icon: Icons.video_call,
          title: "Tele Medication",
        ),
        EachButton(
          icon: Icons.add,
          title: "Clinic Visit",
        ),
      ],
    );
  }
}

class EachButton extends StatelessWidget {
  final String title;
  final IconData icon;

  EachButton({
    Key key,
    this.title,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      color: Colors.white,
      //elevation: 10,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        children: [
          Icon(
            icon,
            color: Colors.blue,
          ),
          Text(
            "  $title",
            style: TextStyle(
              color: Colors.blue,
              fontSize: 15,
              //fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
      onPressed: () {},
    );
  }
}
