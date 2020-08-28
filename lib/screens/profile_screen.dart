import 'package:flutter/material.dart';
import '../widgets/profile_Screen/p_s_email_phone_Card.dart';
import '../widgets/profile_Screen/p_s_pic_name_ListTile.dart';
import '../widgets/profile_Screen/p_s_details_card.dart';
import '../widgets/profile_Screen/p_s_appointment_button.dart';

class ProfileScreen extends StatelessWidget {
  static const rountName = '/profile';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white.withOpacity(0.9),
      body: Container(
        margin: EdgeInsets.only(top: 30),
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: Icon(Icons.arrow_back),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.settings),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
            PSPicNameListTile(),
            PSEmailPhoneCard(),
            PSAppointmentButton(),
            Expanded(
              child: ListView.builder(
                  itemCount: 5,
                  itemBuilder: (context, index) => Column(
                        children: [
                          PSDetailCard(),
                          SizedBox(
                            height: 20,
                          )
                        ],
                      )),
            )
          ],
        ),
      ),
    );
  }
}
