import 'package:flutter/material.dart';
import 'package:collection/collection.dart';

import '../data/doctors_data.dart';
import '../models/doctor.dart';

class Doctors with ChangeNotifier {
  List<Doctor> _doctors = [];

  List<Doctor> get allDoctors => [..._doctors];

  Future<void> fetchDoctors() async {
    // API call
    _doctors = await DoctorsData.getAllDoctors();

    notifyListeners();
  }

  Future<Doctor?> getDoctorById(String id) async {
    return _doctors.firstWhereOrNull((doctor) => doctor.id == id);
  }
}
