import '../models/doctor.dart';

/// Just used as initial data for the app and acts as a sort of backend service
class DoctorsData {
  static const List<Doctor> _allDoctors = [
    Doctor(
      id: 'DC-1025',
      firstName: 'Faris',
      lastName: 'Hadžiomerović',
      profileImageUrl: 'https://i.ibb.co/frkgwqX/USVisa-Photo.jpg',
    ),
    Doctor(
      id: 'DC-2510',
      firstName: 'Walter',
      lastName: 'White',
      profileImageUrl:
          'https://static1.thegamerimages.com/wordpress/wp-content/uploads/2022/08/walter-white-multiversus.jpg',
    ),
  ];

  static Future<Doctor> getDoctorById(String id) async {
    return _allDoctors.firstWhere((doctor) => doctor.id == id);
  }

  static Future<List<Doctor>> getAllDoctors() async {
    return [..._allDoctors];
  }

  /// this is just to get some data easily and does not represent any sort of logic
  static Doctor getLoginInfo({int index = 0}) {
    return _allDoctors.elementAt(index);
  }
}
