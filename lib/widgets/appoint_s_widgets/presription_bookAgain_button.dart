import 'package:doctor_duniya/screens/medicine/prescribe_medicine_screen.dart';
import 'package:flutter/material.dart';

class PrescriptionBookAgainButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Spacer(),
        OutlineButton.icon(
          onPressed: () {
            Navigator.of(context).pushNamed(PrescribeMedicineButton.routName);
          },
          icon: Icon(Icons.donut_large),
          label: Text("Prescription"),
        ),
        SizedBox(
          width: 7,
        ),
        OutlineButton.icon(
          onPressed: () {},
          icon: Icon(Icons.edit_attributes),
          label: Text("Book Again"),
        )
      ],
    );
  }
}
