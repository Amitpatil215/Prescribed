import '../Model/doctor.dart';

class DoctorsProviders {
  List<Doctor> _doctorsList = [];

  //get doctors list
  List<Doctor> get doctorsList {
    return [..._doctorsList];
  }
}
