import 'package:flutter/material.dart';

class TimeOfDayChip extends StatefulWidget {
  @override
  _TimeOfDayChipState createState() => _TimeOfDayChipState();
}

class _TimeOfDayChipState extends State<TimeOfDayChip> {
  var _isMorning = true;
  var _isNoon = false;
  var _isNight = true;
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
                  style: TextStyle(
                    fontSize: 16,
                    color: _isMorning ? Colors.white : Colors.black,
                  ),
                ),
              ),
              backgroundColor:
                  _isMorning ? Colors.purpleAccent : Colors.grey.shade300,
            ),
            onTap: () {
              setState(() {
                _isMorning = !_isMorning;
              });
            },
          ),
          const SizedBox(width: 5),
          GestureDetector(
            child: Chip(
              label: Container(
                padding: EdgeInsets.all(8),
                child: Text(
                  "Noon",
                  style: TextStyle(
                    fontSize: 16,
                    color: _isNoon ? Colors.white : Colors.black,
                  ),
                ),
              ),
              backgroundColor:
                  _isNoon ? Colors.purpleAccent : Colors.grey.shade300,
            ),
            onTap: () {
              setState(() {
                _isNoon = !_isNoon;
              });
            },
          ),
          SizedBox(width: 5),
          GestureDetector(
            child: Chip(
              label: Container(
                padding: EdgeInsets.all(8),
                child: Text(
                  "Night",
                  style: TextStyle(
                    fontSize: 16,
                    color: _isNight ? Colors.white : Colors.black,
                  ),
                ),
              ),
              backgroundColor:
                  _isNight ? Colors.purpleAccent : Colors.grey.shade300,
            ),
            onTap: () {
              setState(() {
                _isNight = !_isNight;
              });
            },
          ),
        ],
      ),
    );
  }
}
