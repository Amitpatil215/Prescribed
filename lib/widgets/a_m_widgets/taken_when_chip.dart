import 'package:flutter/material.dart';

class TakenWhenChip extends StatefulWidget {
  int takenWhen;
  TakenWhenChip(this.takenWhen);
  @override
  _TakenWhenChipState createState() => _TakenWhenChipState();
}

class _TakenWhenChipState extends State<TakenWhenChip> {
  var _selectedText = 0;
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
                    color: _selectedText == 0 ? Colors.white : Colors.black,
                  ),
                ),
              ),
              backgroundColor: _selectedText == 0
                  ? Colors.purpleAccent
                  : Colors.grey.shade300,
            ),
            onTap: () {
              setState(() {
                _selectedText = 0;
              });
              widget.takenWhen = 0;
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
                    color: _selectedText == 1 ? Colors.white : Colors.black,
                  ),
                ),
              ),
              backgroundColor: _selectedText == 1
                  ? Colors.purpleAccent
                  : Colors.grey.shade300,
            ),
            onTap: () {
              setState(() {
                _selectedText = 1;
              });
              widget.takenWhen = 1;
            },
          ),
        ],
      ),
    );
  }
}
