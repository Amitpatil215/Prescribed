import 'package:flutter/material.dart';

class TimeOfDayChip extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 25),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          GestureDetector(
            child: Chip(
              label: Container(
                padding: EdgeInsets.all(8),
                child: Text(
                  "Morning",
                  style: TextStyle(fontSize: 16),
                ),
              ),
              backgroundColor: Colors.yellow,
            ),
            onTap: () {},
          ),
          SizedBox(width: 5),
          GestureDetector(
            child: Chip(
              label: Container(
                padding: EdgeInsets.all(8),
                child: Text(
                  "Noon",
                  style: TextStyle(fontSize: 16),
                ),
              ),
              backgroundColor: Colors.yellow,
            ),
            onTap: () {},
          ),
          SizedBox(width: 5),
          GestureDetector(
            child: Chip(
              label: Container(
                padding: EdgeInsets.all(8),
                child: Text(
                  "Night",
                  style: TextStyle(fontSize: 16),
                ),
              ),
              backgroundColor: Colors.yellow,
            ),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
