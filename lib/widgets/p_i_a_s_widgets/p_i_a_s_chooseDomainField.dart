import 'package:doctor_duniya/Model/doctor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';

class PIASChooseDomainField extends StatelessWidget {
  PIASChooseDomainField({
    Key key,
    @required Doctor userData,
  })  : _userData = userData,
        super(key: key);

  final Doctor _userData;
  final TextEditingController domainController = TextEditingController();

  final List<String> platform = ["Dentist", "Psychatrist", "Physio"];

  @override
  Widget build(BuildContext context) {
    domainController.text =
        _userData.field != null ? _userData?.field?.toString() : "";
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          Icon(
            FlutterIcons.profile_ant,
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
              suggestionsCallback: (pattern) => platform.where(
                (item) => item.toLowerCase().contains(pattern.toLowerCase()),
              ),
              onSuggestionSelected: (suggestion) {
                this.domainController.text = suggestion;
              },
              textFieldConfiguration: TextFieldConfiguration(
                controller: domainController,
                decoration: InputDecoration(
                  hintText: "e.g Psychiatrist",
                  labelText: "Domain",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
                keyboardType: TextInputType.number,
              ),
              onSaved: (value) {
                if (value.isEmpty) {
                  value = null;
                }
                value = value[0].toUpperCase() + value.substring(1);
                print(value);
                _userData.field = value;
              },
            ),
          )
        ],
      ),
    );
  }
}
