import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BASBTimePicker extends StatelessWidget {
  static List<TimeOfDay> morningTime;
  static List<TimeOfDay> afterNoonTime;
  static List<TimeOfDay> eveningTime;
  static List<TimeOfDay> nightTime;

  Iterable<TimeOfDay> getTimes(
      TimeOfDay startTime, TimeOfDay endTime, Duration step) sync* {
    var hour = startTime.hour;
    var minute = startTime.minute;

    do {
      yield TimeOfDay(hour: hour, minute: minute);
      minute += step.inMinutes;
      while (minute >= 60) {
        minute -= 60;
        hour++;
      }
    } while (hour < endTime.hour ||
        (hour == endTime.hour && minute <= endTime.minute));
  }

  void partOfDayWiseList(List<TimeOfDay> times) {
    morningTime = times
        .where((element) => element.hour >= 4 && element.hour < 12)
        .toList();
    afterNoonTime = times
        .where((element) => element.hour >= 12 && element.hour < 17)
        .toList();
    eveningTime = times
        .where((element) => element.hour >= 17 && element.hour < 21)
        .toList();
    nightTime = times
        .where((element) => element.hour >= 21 && element.hour < 24)
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    // final startTime = TimeOfDay.fromDateTime(DateTime.now());
    final startTime = TimeOfDay(hour: 2, minute: 0);
    final endTime = TimeOfDay(hour: 23, minute: 0);
    final step = Duration(minutes: 30);
    final times = getTimes(startTime, endTime, step).map((tod) => tod).toList();
    partOfDayWiseList(times);
    return Container(
        padding: EdgeInsets.only(left: 10, right: 7),
        child: Column(
          children: [
            if (morningTime.isNotEmpty)
              PartOfDayWiseTimeSlot(
                times: morningTime,
                title: "Morning",
              ),
            if (morningTime.isNotEmpty) SizedBox(height: 20),
            if (afterNoonTime.isNotEmpty)
              PartOfDayWiseTimeSlot(
                times: afterNoonTime,
                title: "Afternoon",
              ),
            if (afterNoonTime.isNotEmpty) SizedBox(height: 20),
            if (eveningTime.isNotEmpty)
              PartOfDayWiseTimeSlot(
                times: eveningTime,
                title: "Evening",
              ),
            if (eveningTime.isNotEmpty) SizedBox(height: 20),
            if (nightTime.isNotEmpty)
              PartOfDayWiseTimeSlot(
                times: nightTime,
                title: "Night",
              ),
          ],
        ));
  }
}

class PartOfDayWiseTimeSlot extends StatefulWidget {
  final String title;
  final List<TimeOfDay> times;

  PartOfDayWiseTimeSlot({
    Key key,
    this.title,
    @required this.times,
  }) : super(key: key);

  @override
  _PartOfDayWiseTimeSlotState createState() => _PartOfDayWiseTimeSlotState();
}

class _PartOfDayWiseTimeSlotState extends State<PartOfDayWiseTimeSlot> {
  TimeOfDay _selectedTime;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(widget.title, style: TextStyle(fontSize: 18)),
          SizedBox(height: 10),
          Container(
            height: 40.h,
            width: double.infinity,
            child: GridView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: widget.times.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 1,
                childAspectRatio: 1 / 2,
                mainAxisSpacing: 10,
              ),
              itemBuilder: (context, index) => GestureDetector(
                child: Container(
                  child: Center(
                      child: Text(
                    widget.times.elementAt(index).format(context),
                    style: TextStyle(
                        fontWeight:
                            _selectedTime == widget.times.elementAt(index)
                                ? FontWeight.bold
                                : null),
                  )),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(color: Colors.grey),
                    color: _selectedTime == widget.times.elementAt(index)
                        ? Colors.white
                        : null,
                  ),
                ),
                onTap: () {
                  setState(() {
                    _selectedTime = widget.times.elementAt(index);
                  });

                  print(_selectedTime.format(context));
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
