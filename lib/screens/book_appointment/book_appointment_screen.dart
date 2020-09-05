import 'package:flutter/material.dart';
import '../../widgets/h_s_widgets/h_s_helpButton.dart';

class BookAppointmentScreen extends StatelessWidget {
  static const routName = 'book-appointment';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white.withOpacity(0),
      ),
      body: Container(
        child: Row(
          children: [HSHelpButton()],
        ),
      ),
    );
  }
}
