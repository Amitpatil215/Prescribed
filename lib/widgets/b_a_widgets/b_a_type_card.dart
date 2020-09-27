import '../../providers/select_DateTimeType_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class TypeCard extends StatelessWidget {
  final List<Map<String, dynamic>> steps;
  final isTelemedication;
  const TypeCard({
    Key key,
    this.steps,
    this.isTelemedication,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _isTelemedicationSelected =
        Provider.of<SelectDateTimeTypeProvider>(context).fetchAppointTypeIsTele;
    return GestureDetector(
      child: Container(
        height: 200.h,
        width: 300.w,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(25),
            border: Border.all(
                color: _isTelemedicationSelected == isTelemedication
                    ? Colors.black
                    : Colors.grey)),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(20),
              child: Row(
                children: [
                  Icon(isTelemedication
                      ? Icons.call
                      : FlutterIcons.hospital_faw5),
                  Text(
                    isTelemedication ? "Telemedication" : "Clinic Consultaion",
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  Spacer(),
                  Icon(
                    _isTelemedicationSelected == isTelemedication
                        ? Icons.check
                        : null,
                    color: Colors.green,
                    size: 25,
                  ),
                ],
              ),
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25),
                  topRight: Radius.circular(25),
                ),
                border: Border.all(color: Colors.grey),
              ),
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: Column(
                children: [
                  ...steps
                      .map(
                        (eachElement) => StepsinEachCard(
                          icon: eachElement['icon'],
                          description: eachElement['Description'],
                        ),
                      )
                      .toList(),
                ],
              ),
            ),
          ],
        ),
      ),
      onTap: () {
        Provider.of<SelectDateTimeTypeProvider>(context, listen: false)
            .setAppoitmentType(istele: isTelemedication);
      },
    );
  }
}

class StepsinEachCard extends StatelessWidget {
  final IconData icon;
  final String description;
  const StepsinEachCard({
    Key key,
    this.icon,
    this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon),
        Text(description),
      ],
    );
  }
}
