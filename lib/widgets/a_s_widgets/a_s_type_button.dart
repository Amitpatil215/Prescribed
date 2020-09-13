import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/auth_user_provider.dart';

class ASTypeButton extends StatefulWidget {
  @override
  _ASTypeButtonState createState() => _ASTypeButtonState();
}

class _ASTypeButtonState extends State<ASTypeButton> {
  var _isPatient = true;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GridTile(
          child: GestureDetector(
            onTap: () {
              setState(() {
                _isPatient = !_isPatient;
                Provider.of<AuthUser>(context, listen: false)
                    .setUserTypeIsPatient(_isPatient);
              });
            },
            child: Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: _isPatient ? Colors.pinkAccent : null,
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(
                      color: _isPatient ? Colors.white : Colors.black),
                ),
                child: Center(
                  child: Text(
                    "Patient",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 25,
                      color: _isPatient ? Colors.white : Colors.black,
                    ),
                  ),
                )),
          ),
        ),
        SizedBox(
          width: 50,
        ),
        GestureDetector(
          onTap: () {
            setState(() {
              _isPatient = !_isPatient;
              Provider.of<AuthUser>(context, listen: false)
                  .setUserTypeIsPatient(_isPatient);
            });
          },
          child: GridTile(
            child: Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: !_isPatient ? Colors.pinkAccent : null,
                borderRadius: BorderRadius.circular(30),
                border: Border.all(
                  color: !_isPatient ? Colors.white : Colors.black,
                ),
              ),
              child: Center(
                child: Text(
                  "Doctor",
                  style: TextStyle(
                    fontSize: 25,
                    color: !_isPatient ? Colors.white : Colors.black,
                  ),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
