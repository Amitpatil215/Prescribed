import '../../screens/book_appointment/slot_book_screen.dart';
import 'package:flutter/material.dart';
import '../../widgets/b_a_widgets/b_a_type_card.dart';
import '../../widgets/colors.dart';

class BookAppointmentScreen extends StatelessWidget {
  static const routName = 'book-appointment';
  final List<Map<String, dynamic>> teleMedicationSteps = [
    {
      "icon": Icons.arrow_drop_down,
      "Description": "Choose your time slot",
    },
    {
      "icon": Icons.arrow_drop_down,
      "Description": "Pay required amount",
    },
    {
      "icon": Icons.arrow_drop_down,
      "Description": "Doctor confirm's your appointment",
    },
    {
      "icon": Icons.arrow_drop_down,
      "Description": "Be on time for Consultaion",
    }
  ];
  final List<Map<String, dynamic>> clinicConsultaionSteps = [
    {
      "icon": Icons.arrow_drop_down,
      "Description": "Choose your time slot",
    },
    {
      "icon": Icons.arrow_drop_down,
      "Description": "Pay required amount Online / Cash",
    },
    {
      "icon": Icons.arrow_drop_down,
      "Description": "Doctor confirm's your appointment",
    },
    {
      "icon": Icons.arrow_drop_down,
      "Description": "Be on time at hospital for Check up",
    }
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: appBarColor,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TypeCard(
              isTelemedication: true,
              steps: teleMedicationSteps,
            ),
            SizedBox(height: 20),
            TypeCard(
              isTelemedication: false,
              steps: clinicConsultaionSteps,
            )
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(
        label: Row(
          children: [
            Text(
              "Proceed",
              style: TextStyle(color: Colors.black),
            ),
            SizedBox(width: 10),
            Icon(
              Icons.navigate_next,
              color: Colors.green,
            ),
          ],
        ),
        isExtended: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        onPressed: () {
          Navigator.of(context).pushNamed(SlotBookScreen.routeName);
        },
      ),
    );
  }
}
