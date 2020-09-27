import 'package:doctor_duniya/providers/select_DateTimeType_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import '../../screens/book_appointment/slot_book_screen.dart';

// ! Do change time to date time
// * at time of passing data
class DKMAvailability extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        AvailabilityTile(
          isTelemedication: true,
          time: "02:00 PM - 04:00 PM",
        ),
        SizedBox(width: 7.w),
        AvailabilityTile(
          isTelemedication: false,
          time: "06:00 PM - 10:00 PM",
        ),
      ],
    );
  }
}

class AvailabilityTile extends StatelessWidget {
  final String time;
  final bool isTelemedication;

  AvailabilityTile({
    Key key,
    this.time,
    this.isTelemedication,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        child: Container(
          padding: const EdgeInsets.all(7),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  children: [
                    Text(isTelemedication
                        ? "Telemedication"
                        : "Clinic Consultation"),
                    SizedBox(height: 5),
                    Text(time),
                  ],
                ),
              ),
              Container(
                child: Icon(
                  Icons.navigate_next,
                  size: 25,
                ),
              )
            ],
          ),
        ),
        onTap: () {
          Provider.of<SelectDateTimeTypeProvider>(context, listen: false)
              .setAppoitmentType(istele: isTelemedication);
          Navigator.of(context).pushNamed(SlotBookScreen.routeName);
        },
      ),
    );
  }
}
