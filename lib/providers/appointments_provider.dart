import 'package:flutter/material.dart';

import '../data/appointments_data.dart';
import '../models/appointment.dart';

class Appointments with ChangeNotifier {
  List<Appointment> _appointments = [];

  List<Appointment> get allAppointments => [..._appointments];

  Future<void> fetchAppointmentsByDoctorId(String doctorId) async {
    // API call
    _appointments = await AppointmentsData.getAppointmentsByDoctorId(doctorId);

    notifyListeners();
  }

  List<Appointment> getAppointmentsByDoctorAndPatientId({
    required String doctorId,
    required String patientId,
  }) {
    return _appointments
        .where(
            (appointment) => appointment.doctorId == doctorId && appointment.patientId == patientId)
        .toList();
  }

  List<Appointment> getAppointmentsByPatientId(String id) {
    return _appointments.where((appointment) => appointment.patientId == id).toList();
  }

  List<Appointment> getAppointmentsByDoctorId(String id) {
    return _appointments.where((appointment) => appointment.doctorId == id).toList();
  }
}
