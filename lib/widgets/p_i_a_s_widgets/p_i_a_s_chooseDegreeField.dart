import 'package:doctor_duniya/Model/doctor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';

class PIASChooseDegreeField extends StatelessWidget {
  PIASChooseDegreeField({
    Key key,
    @required Doctor userData,
  })  : _userData = userData,
        super(key: key);

  final Doctor _userData;
  final TextEditingController degreeController = TextEditingController();

  final List<String> degree = ["MD-Physco", "MBBS", "BAMS"];
  @override
  Widget build(BuildContext context) {
    degreeController.text =
        _userData.field != null ? _userData?.field?.toString() : "";
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          Icon(
            FlutterIcons.graduation_cap_ent,
            size: 30,
          ),
          SizedBox(
            width: 15,
          ),
          Expanded(
            child: TypeAheadFormField(
              itemBuilder: (context, itemData) {
                return ListTile(
                  title: Text(itemData),
                );
              },
              suggestionsCallback: (pattern) => degree.where(
                (item) => item.toLowerCase().contains(pattern.toLowerCase()),
              ),
              onSuggestionSelected: (suggestion) {
                this.degreeController.text = suggestion;
              },
              textFieldConfiguration: TextFieldConfiguration(
                controller: degreeController,
                decoration: InputDecoration(
                  hintText: "e.g MBBS,MD",
                  labelText: "Degree",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
                keyboardType: TextInputType.text,
              ),
              onSaved: (value) {
                if (value.isEmpty) {
                  value = null;
                } else {
                  value = value[0].toUpperCase() + value.substring(1);
                }
                _userData.field = value;
              },
            ),
          )
        ],
      ),
    );
  }
}
