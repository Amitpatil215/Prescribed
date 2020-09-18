import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:intl/intl.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import '../../Model/doctor.dart';
import '../../providers/doctors_provider.dart';

class AvailabilityAddScreen extends StatelessWidget {
  static const routName = "";
  final format = DateFormat("yyyy-MM-dd hh:mm a");

  void _saveForm(BuildContext context, var editedUser) async {
    await Provider.of<DoctorsProvider>(context, listen: false)
        .saveEditedUser(editedUser)
        .then((value) {});
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    var _userData = Provider.of<Doctor>(context);
    print(DateFormat("dd-MM-yyyy hh:mm a").format(_userData.cfrom));
    return Scaffold(
      appBar: AppBar(
        title: Text("Update Availability"),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 7, vertical: 15),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Title("Telemedication Consultaion", FlutterIcons.call_mdi),
              SizedBox(height: 10),
              Container(
                width: 0.95.wp,
                child: DateTimeField(
                  format: format,
                  decoration: InputDecoration(
                    labelText: "from",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  onShowPicker: (context, currentValue) async {
                    final date = await showDatePicker(
                      context: context,
                      firstDate: DateTime.now(),
                      initialDate: currentValue ?? DateTime.now(),
                      lastDate: DateTime(2025),
                    );
                    if (date != null) {
                      final time = await showTimePicker(
                        context: context,
                        initialTime: TimeOfDay.fromDateTime(
                            currentValue ?? DateTime.now()),
                      );
                      _userData.tfrom = DateTimeField.combine(date, time);
                      return _userData.tfrom;
                    } else {
                      _userData.tfrom = currentValue;
                      return currentValue;
                    }
                  },
                ),
              ),
              SizedBox(height: 10),
              Container(
                width: 0.95.wp,
                child: DateTimeField(
                  format: format,
                  decoration: InputDecoration(
                    labelText: "To",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  onShowPicker: (context, currentValue) async {
                    final date = await showDatePicker(
                      context: context,
                      firstDate: DateTime.now(),
                      initialDate: currentValue ?? DateTime.now(),
                      lastDate: DateTime(2025),
                    );
                    if (date != null) {
                      final time = await showTimePicker(
                        context: context,
                        initialTime: TimeOfDay.fromDateTime(
                            currentValue ?? DateTime.now()),
                      );
                      _userData.tto = DateTimeField.combine(date, time);
                      return _userData.tto;
                    } else {
                      _userData.tto = currentValue;
                      return currentValue;
                    }
                  },
                ),
              ),
              SizedBox(height: 20),
              Title("Clinic Consultaion", FlutterIcons.hospital_alt_faw5s),
              SizedBox(height: 10),
              Container(
                width: 0.95.wp,
                child: DateTimeField(
                  format: format,
                  decoration: InputDecoration(
                    labelText: "from",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  onShowPicker: (context, currentValue) async {
                    final date = await showDatePicker(
                      context: context,
                      firstDate: DateTime.now(),
                      initialDate: currentValue ?? DateTime.now(),
                      lastDate: DateTime(2025),
                    );
                    if (date != null) {
                      final time = await showTimePicker(
                        context: context,
                        initialTime: TimeOfDay.fromDateTime(
                            currentValue ?? DateTime.now()),
                      );
                      _userData.cfrom = DateTimeField.combine(date, time);
                      return _userData.cfrom;
                    } else {
                      _userData.cfrom = currentValue;
                      return currentValue;
                    }
                  },
                ),
              ),
              SizedBox(height: 10),
              Container(
                width: 0.95.wp,
                child: DateTimeField(
                  format: format,
                  decoration: InputDecoration(
                    labelText: "To",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  onShowPicker: (context, currentValue) async {
                    final date = await showDatePicker(
                      context: context,
                      firstDate: DateTime.now(),
                      initialDate: currentValue ?? DateTime.now(),
                      lastDate: DateTime(2025),
                    );
                    if (date != null) {
                      final time = await showTimePicker(
                        context: context,
                        initialTime: TimeOfDay.fromDateTime(
                            currentValue ?? DateTime.now()),
                      );
                      _userData.cto = DateTimeField.combine(date, time);
                      return _userData.cto;
                    } else {
                      _userData.cto = currentValue;
                      return currentValue;
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(
        label: Text(
          "Save",
          style: TextStyle(color: Colors.black),
        ),
        isExtended: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        onPressed: () {
          _saveForm(context, _userData);
        },
      ),
    );
  }
}

class Title extends StatelessWidget {
  final title;
  final icon;

  Title(this.title, this.icon);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon),
        SizedBox(width: 10),
        Text(
          title,
          style: TextStyle(
            fontSize: 18,
          ),
        ),
      ],
    );
  }
}
