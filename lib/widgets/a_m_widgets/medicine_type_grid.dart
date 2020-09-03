import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

class MedicineTypeGrid extends StatefulWidget {
  var medicine;
  MedicineTypeGrid(this.medicine);
  @override
  _MedicineTypeGridState createState() => _MedicineTypeGridState();
}

class _MedicineTypeGridState extends State<MedicineTypeGrid> {
  var _selectedType = 1;

  var _mTypeList = [
    ["Syrup", FlutterIcons.prescription_bottle_faw5s],
    ["Tablet", FlutterIcons.capsules_faw5s],
    ["Drops", FlutterIcons.drop_ent],
    ["Injection", FlutterIcons.syringe_faw5s],
    ["Cream", FlutterIcons.page_first_mco],
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      height: 100,
      child: GridView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: _mTypeList.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 1,
          childAspectRatio: 2.5 / 2.4,
          crossAxisSpacing: 10,
          mainAxisSpacing: 20,
        ),
        itemBuilder: (context, index) {
          return GestureDetector(
            child: Container(
              height: 120,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(
                  Radius.circular(15.0),
                ),
                border: _selectedType == index
                    ? Border.all(color: Colors.purple)
                    : null,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    _mTypeList[index][1],
                  ),
                  Text(_mTypeList[index][0]),
                ],
              ),
            ),
            onTap: () {
              setState(() {
                _selectedType = index;
              });
              widget.medicine["medicineType"] = _mTypeList[_selectedType][0];
            },
          );
        },
      ),
    );
  }
}
