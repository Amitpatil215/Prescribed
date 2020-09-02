import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import '../../widgets/a_m_widgets/time_of_day_Chip.dart';
import '../../widgets/a_m_widgets/taken_when_chip.dart';
import '../../widgets/a_m_widgets/count_dosage.dart';
import '../../widgets/a_m_widgets/medicine_type_grid.dart';

class AddMedicine extends StatelessWidget {
  static const routeName = 'add-medicine';
  String medicineName;
  var medicineType = "";
  var dosageCount = 1;
  var takenWhen = 0; // 0 for after food
  List<String> timeOfday = ["Morning", "Night"];
  final _formKey = GlobalKey<FormState>();
  void _saveForm(BuildContext context) async {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      print(medicineName);
      print(medicineType);
      print(dosageCount.toString());
      print(timeOfday);
      print(takenWhen.toString());

      // final userID = FirebaseAuth.instance.currentUser.uid;
      // try {
      //   await FirebaseFirestore.instance.collection("user").doc(userID).set({
      //     "name": _name,
      //     "gender": _genderString,
      //     "location": _location,
      //     "phone": _contactNo,
      //     "email": _emailAddress,
      //   });
      // } catch (error) {
      //   print("Error in storing profile edit page with $error");
      // }
      // Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
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
          MedicineTypeGrid(medicineType),
          NameOfSubTitle("Dosage"),
          CountDosage(dosageCount),
          NameOfSubTitle("Time of the Day"),
          TimeOfDayChip(timeOfday),
          NameOfSubTitle("To be taken"),
          TakenWhenChip(takenWhen),
          Spacer(),
          Container(
              margin: EdgeInsets.only(bottom: 25),
              child: RaisedButton(
                child: Text(
                  "Save",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                onPressed: () {
                  _saveForm(context);
                },
                elevation: 5,
              )),
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
