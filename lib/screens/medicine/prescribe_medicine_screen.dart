import 'package:doctor_duniya/screens/medicine/add_medicine.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

class PrescribeMedicineButton extends StatelessWidget {
  static const routName = 'prescribe-medicine';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        title: Text("Prescribed Medications"),
      ),
      floatingActionButton: FloatingActionButton.extended(
        icon: Icon(
          Icons.add,
          color: Colors.black,
        ),
        label: Text(
          "Add Medicine",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        onPressed: () {
          Navigator.of(context).pushNamed(AddMedicine.routeName);
        },
      ),
      body: Column(
        children: [
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.wb_sunny,
                color: Colors.amber,
              ),
              SizedBox(
                width: 5,
              ),
              Text(
                "Morning",
                style: TextStyle(
                  fontSize: 25,
                ),
              ),
            ],
          ),
          Card(
            margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Container(
              padding: EdgeInsets.only(left: 10),
              width: double.infinity,
              child: Row(
                children: [
                  Container(
                    height: 50,
                    width: 50,
                    color: Colors.blue,
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Paracetamol 200",
                          style: TextStyle(
                            fontSize: 22,
                          ),
                        ),
                        Text(
                          "500 Mg",
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                        Row(
                          children: [
                            Icon(FlutterIcons.food_fork_drink_mco),
                            SizedBox(width: 5),
                            Text(
                              "After Meal",
                              style: TextStyle(
                                fontSize: 18,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Icon(FlutterIcons.done_mdi),
                            SizedBox(width: 5),
                            Text(
                              "Dosage : 1 Tab/day",
                              style: TextStyle(
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Icon(FlutterIcons.clock_evi),
                            SizedBox(width: 5),
                            Text(
                              "Duration : 7 Days",
                              style: TextStyle(
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                        Text(
                          "Prescribed On : 10 May 2020",
                          style: TextStyle(
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
