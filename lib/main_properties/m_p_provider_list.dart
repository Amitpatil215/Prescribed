import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import '../Model/doctor.dart';
import '../Model/userType.dart';
import '../providers/auth_user_provider.dart';
import '../Model/patient.dart';
import '../providers/doctors_provider.dart';
import '../providers/patient_profile_provider.dart';

List<SingleChildWidget> mPProviderList = [
  ChangeNotifierProvider.value(
    value: AuthUser(),
  ),
  StreamProvider<UserType>(
    create: (context) => AuthUser().getUserTypeisPatient(),
  ),
  ChangeNotifierProvider.value(
    value: PatientProfileProvider(),
  ),
  StreamProvider<Patient>(
    create: (context) => PatientProfileProvider().patientData(),
    catchError: (context, error) {
      print("Patient Stream Provider Error in Main.dart $error");
      return Patient();
    },
    initialData: Patient(),
    updateShouldNotify: (_, __) => true,
  ),
  ChangeNotifierProvider.value(
    value: PatientProfileProvider(),
  ),
  StreamProvider<Doctor>(
    create: (context) => DoctorsProvider().doctorData(),
    catchError: (context, error) {
      print("Doctor Stream Provider Error in Main.dart $error");

      return Doctor();
    },
    updateShouldNotify: (_, __) => true,
  ),
  ChangeNotifierProvider(
    create: (context) => DoctorsProvider(),
  ),
];
