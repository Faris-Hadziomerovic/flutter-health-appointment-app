import 'package:flutter/material.dart';

import '../data/patients_data.dart';
import '../models/patient.dart';

class Patients with ChangeNotifier {
  List<Patient> _allPatients = [];

  List<Patient> _localPatients = [];

  List<Patient> get allPatients => [..._allPatients];

  List<Patient> get localPatients => [..._localPatients];

  Future<void> fetchPatientsByDoctorId(String doctorId) async {
    // API call
    _allPatients = await PatientsData.getPatientsByDoctorId(doctorId);

    _localPatients = [..._allPatients];

    notifyListeners();
  }

  Future<void> filterPatients(String query) async {
    query = query.toLowerCase();

    _localPatients = _allPatients
        .where((patient) =>
            patient.id.toLowerCase().contains(query) ||
            patient.firstName.toLowerCase().contains(query) ||
            patient.lastName.toLowerCase().contains(query))
        .toList();

    notifyListeners();
  }
}
