import 'package:flutter/material.dart';

class CountDosage extends StatefulWidget {
  final medicine;
  CountDosage(this.medicine);

  @override
  _CountDosageState createState() => _CountDosageState();
}

class _CountDosageState extends State<CountDosage> {
  var _dosageCount = 1;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          InkWell(
            child: Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Center(
                child: Text(
                  "-",
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
            ),
            onTap: () {
              if (_dosageCount > 1) {
                setState(() {
                  _dosageCount -= 1;
                });
                widget.medicine["dosageCount"] = _dosageCount;
              }
            },
          ),
          SizedBox(width: 5),
          OutlineButton(
              child: Text(
                "${_dosageCount.toString()} ",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                ),
              ),
              onPressed: null),
          SizedBox(width: 5),
          InkWell(
            child: Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Center(
                child: Text(
                  "+",
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
              ),
            ),
            onTap: () {
              setState(() {
                _dosageCount += 1;
              });
              widget.medicine["dosageCount"] = _dosageCount;
            },
          ),
        ],
      ),
    );
  }
}
