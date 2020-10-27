import 'package:doctor_duniya/screens/appointment_connect/appointment_connect_screen.dart';
import 'package:doctor_duniya/screens/auth_screen.dart';
import 'package:flutter/material.dart';
import '../screens/profile/profile_screen.dart';
import '../screens/profile/my_appointment_screen.dart';
import '../screens/home/categories_see_all_screen.dart';
import '../screens/home/top_doctors_see_all_screen.dart';
import '../screens/medicine/prescribe_medicine_screen.dart';
import '../screens/medicine/add_medicine.dart';
import '../screens/doctor_know_more_screen.dart';
import '../screens/book_appointment/book_appointment_screen.dart';
import '../screens/profile/professional_info_add_screen.dart';
import '../screens/profile/availability_add_screen.dart';
import '../screens/profile/health_measure_add_screen.dart';
import '../screens/profile/profile_edit_screen.dart';
import '../screens/book_appointment/slot_book_screen.dart';
import '../screens/book_appointment/verify_appointmenr_screen.dart';
import '../screens/verification/verify_document_screen.dart';
import '../screens/profile/price_set_screen.dart';

Map<String, Widget Function(BuildContext)> mPRouteTable = {
  AuthScreen.routName: (ctx) {
    return AuthScreen();
  },
  CatergoriesSeeAllScreen.routName: (ctx) {
    return CatergoriesSeeAllScreen();
  },
  TopDoctorsSeeAllScreen.routeName: (ctx) {
    return TopDoctorsSeeAllScreen();
  },
  ProfileScreen.rountName: (ctx) {
    return ProfileScreen();
  },
  DoctorKnowMoreScreen.routName: (ctx) {
    return DoctorKnowMoreScreen();
  },
  BookAppointmentScreen.routName: (ctx) {
    return BookAppointmentScreen();
  },
  AppointmentScreen.routName: (ctx) {
    return AppointmentScreen();
  },
  PrescribeMedicineButton.routName: (ctx) {
    return PrescribeMedicineButton();
  },
  AddMedicine.routeName: (ctx) {
    return AddMedicine();
  },
  ProfileEditScreen.routName: (ctx) {
    return ProfileEditScreen();
  },
  HealthMeasureAddScreen.routeName: (ctx) {
    return HealthMeasureAddScreen();
  },
  ProfessionalInfoAddScreen.routName: (ctx) {
    return ProfessionalInfoAddScreen();
  },
  AvailabilityAddScreen.routName: (ctx) {
    return AvailabilityAddScreen();
  },
  SlotBookScreen.routeName: (ctx) {
    return SlotBookScreen();
  },
  VerifyAppointmentScreen.routeName: (ctx) {
    return VerifyAppointmentScreen();
  },
  VerifyDocumentScreen.routeName: (ctx) {
    return VerifyDocumentScreen();
  },
  PriceSetScreen.routeName: (ctx) {
    return PriceSetScreen();
  },
  AppointmentConnectScreen.routeName: (ctx) {
    return AppointmentConnectScreen();
  },
};
