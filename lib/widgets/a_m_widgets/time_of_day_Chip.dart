import 'package:flutter/material.dart';

class TimeOfDayChip extends StatefulWidget {
  @override
  _TimeOfDayChipState createState() => _TimeOfDayChipState();
}

class _TimeOfDayChipState extends State<TimeOfDayChip> {
  var _selectedText = '';
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
                    color: _selectedText == "Morning"
                        ? Colors.white
                        : Colors.black,
                  ),
                ),
              ),
              backgroundColor: _selectedText == "Morning"
                  ? Colors.purpleAccent
                  : Colors.grey.shade300,
            ),
            onTap: () {
              setState(() {
                _selectedText = "Morning";
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
                    color:
                        _selectedText == "Noon" ? Colors.white : Colors.black,
                  ),
                ),
              ),
              backgroundColor: _selectedText == "Noon"
                  ? Colors.purpleAccent
                  : Colors.grey.shade300,
            ),
            onTap: () {
              setState(() {
                _selectedText = "Noon";
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
                    color:
                        _selectedText == "Night" ? Colors.white : Colors.black,
                  ),
                ),
              ),
              backgroundColor: _selectedText == "Night"
                  ? Colors.purpleAccent
                  : Colors.grey.shade300,
            ),
            onTap: () {
              setState(() {
                _selectedText = "Night";
              });
            },
          ),
        ],
      ),
    );
  }
}
