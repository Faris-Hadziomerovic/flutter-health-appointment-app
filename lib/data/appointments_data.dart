import '../models/appointment.dart';

/// Just used as initial data for the app and acts as a sort of backend service
class AppointmentsData {
  static final List<Appointment> _appointments = [
    Appointment(
      id: 'XX-0001',
      doctorId: 'DC-1025',
      patientId: 'AA-0001',
      dateTime: DateTime(2022, 12, 8, 12, 0),
    ),
    Appointment(
      id: 'XX-0002',
      doctorId: 'DC-1025',
      patientId: 'AA-0001',
      dateTime: DateTime(2023, 1, 3, 14, 30),
    ),
    Appointment(
      id: 'XX-0003',
      doctorId: 'DC-1025',
      patientId: 'AA-0001',
      dateTime: DateTime(2023, 2, 4, 12, 15),
    ),
    Appointment(
      id: 'XX-0004',
      doctorId: 'DC-1025',
      patientId: 'AA-0001',
      dateTime: DateTime(2023, 6, 3, 9, 0),
    ),
    Appointment(
      id: 'XX-0005',
      doctorId: 'DC-1025',
      patientId: 'AA-0002',
      dateTime: DateTime(2021, 9, 10, 13, 45),
    ),
    Appointment(
      id: 'XX-0006',
      doctorId: 'DC-1025',
      patientId: 'AA-0002',
      dateTime: DateTime(2022, 11, 6, 12, 15),
    ),
    Appointment(
      id: 'XX-0007',
      doctorId: 'DC-1025',
      patientId: 'AA-0002',
      dateTime: DateTime(2023, 6, 6, 10, 30),
    ),
    Appointment(
      id: 'XX-0008',
      doctorId: 'DC-1025',
      patientId: 'AA-0002',
      dateTime: DateTime(2023, 9, 1, 10, 15),
    ),
    Appointment(
      id: 'XX-0009',
      doctorId: 'DC-1025',
      patientId: 'AA-0003',
      dateTime: DateTime(2021, 9, 10, 11, 0),
    ),
    Appointment(
      id: 'XX-0010',
      doctorId: 'DC-1025',
      patientId: 'AA-0003',
      dateTime: DateTime(2022, 11, 6, 11, 15),
    ),
    Appointment(
      id: 'XX-0011',
      doctorId: 'DC-2510',
      patientId: 'AA-0004',
      dateTime: DateTime(2023, 6, 6, 15, 15),
    ),
    Appointment(
      id: 'XX-0012',
      doctorId: 'DC-2510',
      patientId: 'AA-0004',
      dateTime: DateTime(2023, 5, 1, 9, 15),
    ),
    Appointment(
      id: 'XX-0013',
      doctorId: 'DC-2510',
      patientId: 'AA-0005',
      dateTime: DateTime(2023, 4, 15, 9, 45),
    ),
    Appointment(
      id: 'XX-0014',
      doctorId: 'DC-1025',
      patientId: 'AA-0006',
      dateTime: DateTime(2023, 5, 30, 11, 30),
    ),
  ];

  static Future<List<Appointment>> getAppointmentsByDoctorId(String id) async {
    return _appointments.where((appointment) => appointment.doctorId == id).toList();
  }
}
