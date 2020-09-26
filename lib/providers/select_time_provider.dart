import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class SelectTimeProvider with ChangeNotifier {
  TimeOfDay _selectTime;

  TimeOfDay get fetchTime {
    return _selectTime;
  }

  void setTimeSelected(TimeOfDay setTime) {
    _selectTime = setTime;
    notifyListeners();
  }
}
