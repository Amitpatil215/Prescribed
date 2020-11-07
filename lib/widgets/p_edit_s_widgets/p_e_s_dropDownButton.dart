import 'package:flutter/material.dart';
import '../../Model/patient.dart';

// ignore: must_be_immutable
class GenderDropDownButton extends StatefulWidget {
  int selectedGender;
  Patient userData;
  GenderDropDownButton(this.selectedGender, this.userData);

  @override
  _GenderDropDownButtonState createState() => _GenderDropDownButtonState();
}

class _GenderDropDownButtonState extends State<GenderDropDownButton> {
  List<DropdownMenuItem<int>> genderList = [];
  void loadGenderList() {
    genderList = [];
    genderList.add(new DropdownMenuItem(
      child: new Text('Male'),
      value: 0,
    ));
    genderList.add(new DropdownMenuItem(
      child: new Text('Female'),
      value: 1,
    ));
    genderList.add(new DropdownMenuItem(
      child: new Text('Other'),
      value: 2,
    ));
  }

  @override
  Widget build(BuildContext context) {
    loadGenderList();
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          Icon(
            null,
            size: 30,
          ),
          SizedBox(
            width: 15,
          ),
          Expanded(
            child: FormField(
              builder: (FormFieldState<String> state) {
                return InputDecorator(
                  decoration: InputDecoration(
                    labelText: "Gender",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton(
                      isDense: true,
                      hint: Text("Select Gender"),
                      items: genderList,
                      value: widget.selectedGender,
                      isExpanded: true,
                      onChanged: (value) {
                        setState(() {
                          widget.selectedGender = value;
                        });
                        widget.userData.gender = Gender.values.elementAt(value);
                      },
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
