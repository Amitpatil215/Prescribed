import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import '../../widgets/a_m_widgets/time_of_day_Chip.dart';
import '../../widgets/a_m_widgets/taken_when_chip.dart';
import '../../widgets/a_m_widgets/count_dosage.dart';
import '../../widgets/a_m_widgets/medicine_type_grid.dart';

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
                          FlutterIcons.file_prescription_faw5s,
                          color: Colors.purple.shade900,
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
          NameOfSubTitle("Medicine Type"),
          MedicineTypeGrid(),
          NameOfSubTitle("Dosage"),
          CountDosage(),
          NameOfSubTitle("Time of the Day"),
          TimeOfDayChip(),
          NameOfSubTitle("To be taken"),
          TakenWhenChip(),
        ],
      ),
    );
  }
}

class NameOfSubTitle extends StatelessWidget {
  String subTitle;
  NameOfSubTitle(this.subTitle);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Text(
            subTitle,
            style: TextStyle(fontSize: 20),
          ),
        ),
      ],
    );
  }
}
