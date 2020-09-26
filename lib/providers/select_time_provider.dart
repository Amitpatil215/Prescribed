import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class SelectTimeProvider with ChangeNotifier {
  TimeOfDay _selectTime = TimeOfDay(hour: 17, minute: 0);
  DateTime _selectedDate = DateTime.now();

  TimeOfDay get fetchTime {
    return _selectTime;
  }

  DateTime get fetchDate {
    return _selectedDate;
  }

  DateTime get fetchAppointmentDate {
    return DateTime(_selectedDate.year, _selectedDate.month, _selectedDate.day,
        _selectTime.hour, _selectTime.minute);
  }

  void setTimeSelected(TimeOfDay setTime) {
    _selectTime = setTime;
    notifyListeners();
  }

  void setDateSelected(DateTime setDate) {
    _selectedDate = setDate;
    notifyListeners();
  }
}
