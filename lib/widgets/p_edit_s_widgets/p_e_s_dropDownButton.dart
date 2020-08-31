import 'package:flutter/material.dart';
class GenderDropDownButton extends StatefulWidget {
  int _selectedGender;
  Function getGenderString;
  GenderDropDownButton(this._selectedGender, this.getGenderString);
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
                      value: widget._selectedGender,
                      isExpanded: true,
                      onChanged: (value) {
                        setState(() {
                          widget._selectedGender = value;
                        });
                        widget.getGenderString(value);
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
