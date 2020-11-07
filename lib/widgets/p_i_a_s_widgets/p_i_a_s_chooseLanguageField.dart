import 'package:doctor_duniya/Model/doctor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';

class PIASChooseLanguageField extends StatelessWidget {
  PIASChooseLanguageField({
    Key key,
    @required Doctor userData,
  })  : _userData = userData,
        super(key: key);
  final Doctor _userData;
  final TextEditingController languageController = TextEditingController();

  final List<String> language = ["Marathi", "Hindi", "English"];

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          Icon(
            FlutterIcons.sina_weibo_mco,
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
              suggestionsCallback: (pattern) => language.where(
                (item) => item.toLowerCase().contains(pattern.toLowerCase()),
              ),
              onSuggestionSelected: (suggestion) {
                this.languageController.text = suggestion;
              },
              textFieldConfiguration: TextFieldConfiguration(
                controller: languageController,
                decoration: InputDecoration(
                  hintText: "e.g Hindi, English",
                  labelText: "Languages",
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
