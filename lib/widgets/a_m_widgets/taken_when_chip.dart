import 'package:flutter/material.dart';

class TakenWhenChip extends StatefulWidget {
  @override
  _TakenWhenChipState createState() => _TakenWhenChipState();
}

class _TakenWhenChipState extends State<TakenWhenChip> {
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
                  "After Food",
                  style: TextStyle(
                    fontSize: 16,
                    color: _selectedText == "After Food"
                        ? Colors.white
                        : Colors.black,
                  ),
                ),
              ),
              backgroundColor: _selectedText == "After Food"
                  ? Colors.purpleAccent
                  : Colors.grey.shade300,
            ),
            onTap: () {
              setState(() {
                _selectedText = "After Food";
              });
            },
          ),
          const SizedBox(width: 5),
          GestureDetector(
            child: Chip(
              label: Container(
                padding: EdgeInsets.all(8),
                child: Text(
                  "Before Food",
                  style: TextStyle(
                    fontSize: 16,
                    color: _selectedText == "Before Food"
                        ? Colors.white
                        : Colors.black,
                  ),
                ),
              ),
              backgroundColor: _selectedText == "Before Food"
                  ? Colors.purpleAccent
                  : Colors.grey.shade300,
            ),
            onTap: () {
              setState(() {
                _selectedText = "Before Food";
              });
            },
          ),
        ],
      ),
    );
  }
}
