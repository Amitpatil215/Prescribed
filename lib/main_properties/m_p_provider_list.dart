import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import '../Model/doctor.dart';
import '../Model/userType.dart';
import '../providers/auth_user_provider.dart';
import '../Model/patient.dart';
import '../providers/doctors_provider.dart';
import '../providers/patient_profile_provider.dart';
import '../providers/select_DateTimeType_provider.dart';
import '../providers/firestor_image_upload_provider.dart';

List<SingleChildWidget> mPProviderList = [
  ChangeNotifierProvider(
    create: (context) => AuthUser(),
  ),
  StreamProvider<UserType>(
    create: (context) => AuthUser().getUserTypeisPatient(),
    catchError: (context, error) {
      print("Error in stream UserType in main.dart $error");
      return;
    },
  ),
  ChangeNotifierProvider(
    create: (context) => SelectDateTimeTypeProvider(),
  ),
  ChangeNotifierProvider(
    create: (context) => PatientProfileProvider(),
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
  ChangeNotifierProvider(
    create: (context) => DoctorsProvider(),
  ),
  StreamProvider<Doctor>(
    create: (context) {
      return DoctorsProvider().doctorData();
    },
    catchError: (context, error) {
      print("Doctor Stream Provider Error in Main.dart $error");
      return Doctor();
    },
    initialData: Doctor(),
    updateShouldNotify: (_, __) => true,
  ),
  ChangeNotifierProvider(
    create: (context) => FirestoreImageUpload(),
  ),
];
