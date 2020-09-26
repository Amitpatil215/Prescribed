import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../providers/select_time_provider.dart';

class BASBDateSelector extends StatefulWidget {
  BASBDateSelector({
    Key key,
  }) : super(key: key);

  @override
  _BASBDateSelectorState createState() => _BASBDateSelectorState();
}

class _BASBDateSelectorState extends State<BASBDateSelector> {
  DatePickerController _controller = DatePickerController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var _selectedValue = Provider.of<SelectTimeProvider>(context).fetchDate;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text("You Selected:"),
        Text(_selectedValue.toString()),
        Container(
          child: DatePicker(
            DateTime.now().subtract(Duration(days: 2)),
            width: 60.w,
            height: 80.h,
            controller: _controller,
            initialSelectedDate: DateTime.now(),
            selectionColor: Colors.white,
            selectedTextColor: Colors.red,
            daysCount: 30,
            inactiveDates: [
              //* We cant choose previous dates
              DateTime.now().subtract(Duration(days: 1)),
              DateTime.now().subtract(Duration(days: 2)),
            ],
            onDateChange: (date) {
              // New date selected
              setState(() {
                _selectedValue = date;
              });
              Provider.of<SelectTimeProvider>(context, listen: false)
                  .setDateSelected(_selectedValue);
            },
          ),
        ),
      ],
    );
  }
}
