import '../models/patient.dart';

/// Just used as initial data for the app and acts as a sort of backend service
class PatientsData {
  static const List<Patient> _allPatients = [
    Patient(
      id: 'AA-0001',
      doctorId: 'DC-1025',
      firstName: 'John',
      lastName: 'Doe',
      profileImageUrl: '',
    ),
    Patient(
      id: 'AA-0002',
      doctorId: 'DC-1025',
      firstName: 'Emily',
      lastName: 'Jones',
      profileImageUrl: '',
    ),
    Patient(
      id: 'AA-0003',
      doctorId: 'DC-1025',
      firstName: 'Jessica',
      lastName: 'Martinez',
      profileImageUrl: '',
    ),
    Patient(
      id: 'AA-0004',
      doctorId: 'DC-2510',
      firstName: 'David',
      lastName: 'Garcia',
      profileImageUrl: '',
    ),
    Patient(
      id: 'AA-0005',
      doctorId: 'DC-2510',
      firstName: 'Martha',
      lastName: 'Wayne',
      profileImageUrl: '',
    ),
    Patient(
      id: 'AA-0006',
      doctorId: 'DC-1025',
      firstName: 'William',
      lastName: 'Johnson',
      profileImageUrl: '',
    ),
  ];

  static Future<List<Patient>> getPatientsByDoctorId(String id) async {
    return _allPatients.where((patient) => patient.doctorId == id).toList();
  }
}
