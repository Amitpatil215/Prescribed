import 'package:flutter/material.dart';

class ASTabButton extends StatefulWidget {
  @override
  _ASTabButtonState createState() => _ASTabButtonState();
}

class _ASTabButtonState extends State<ASTabButton> {
  var _isUpcoming = true;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RaisedButton(
              elevation: _isUpcoming ? 9 : 0,
              color: Colors.white,
              child: Container(
                width: _isUpcoming ? 200 : null,
                height: 30,
                child: Center(
                  child: Text(
                    "Upcoming",
                  ),
                ),
              ),
              onPressed: () {
                setState(() {
                  _isUpcoming = !_isUpcoming;
                });
              },
            ),
            RaisedButton(
              elevation: !_isUpcoming ? 9 : 0,
              color: Colors.white,
              child: Container(
                width: !_isUpcoming ? 200 : null,
                height: 30,
                child: Center(
                  child: Text("Past"),
                ),
              ),
              onPressed: () {
                setState(() {
                  _isUpcoming = !_isUpcoming;
                });
              },
            ),
          ],
        ),
        Container(
          margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          child: Row(
            children: [
              Column(
                children: [
                  Text(
                    "25 \nSept",
                    style: TextStyle(fontSize: 26),
                  ),
                ],
              ),
              Column(
                children: [
                  Container(
                    height: 125,
                    width: 280,
                    margin: EdgeInsets.only(left: 20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                    top: 8.0,
                                    left: 9,
                                  ),
                                  child: Text(
                                    "7:30 PM",
                                    style: TextStyle(
                                      fontSize: 20,
                                    ),
                                  ),
                                ),
                                Text(
                                  "2 h 30 min",
                                  style: TextStyle(
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            Column(
                              children: [
                                Text(
                                  "Meeting with Dr. Duva",
                                  style: TextStyle(
                                    fontSize: 18,
                                  ),
                                ),
                                Container(
                                  child: Row(
                                    children: [
                                      Icon(Icons.location_on),
                                      Text(
                                        "Indira gandhi internationl",
                                        overflow: TextOverflow.fade,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Spacer(),
                        Card(
                          child: Text("Add buttons here"),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        )
      ],
    );
  }
}
