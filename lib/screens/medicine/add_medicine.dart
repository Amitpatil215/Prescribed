import 'package:flutter/material.dart';
import '../../widgets/a_m_widgets/time_of_day_Chip.dart';
import '../../widgets/a_m_widgets/taken_when_chip.dart';

class AddMedicine extends StatelessWidget {
  static const routeName = 'add-medicine';
  String medicineName = "";
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Medicine"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.symmetric(vertical: 7, horizontal: 6),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 10),
                    child: Row(
                      children: [
                        Icon(
                          Icons.donut_large,
                          size: 30,
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Expanded(
                          child: TextFormField(
                            initialValue: null,
                            decoration: InputDecoration(
                              hintText: "e.g.Dolo 15",
                              labelText: "Medication Name",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5),
                              ),
                            ),
                            validator: (value) {
                              if (value.isNotEmpty) {
                                return null;
                              } else {
                                return "Enter Valid Location";
                              }
                            },
                            onSaved: (value) {
                              medicineName = value;
                            },
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Row(
            children: [
              Container(
                margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: Text(
                  "Time of the Day",
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ],
          ),
          TimeOfDayChip(),
          Row(
            children: [
              Container(
                margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: Text(
                  "To be taken",
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ],
          ),
          TakenWhenChip(),
        ],
      ),
    );
  }
}
