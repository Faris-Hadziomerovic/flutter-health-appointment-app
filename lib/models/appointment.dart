import '../enums/appointment_status.dart';

class Appointment {
  final String id;
  final String doctorId;
  final String patientId;
  final DateTime dateTime;
  Duration duration;
  AppointmentStatus? status;

  Appointment({
    required this.id,
    required this.doctorId,
    required this.patientId,
    required this.dateTime,
    this.duration = const Duration(minutes: 15),
    this.status,
  }) {
    status ??=
        dateTime.isAfter(DateTime.now()) ? AppointmentStatus.active : AppointmentStatus.complete;
  }

  @override
  String toString() {
    return '''{
      id: $id, 
      doctorId: $doctorId, 
      patientId: $patientId, 
      dateTime: $dateTime, 
      duration: $duration, 
      profileImageUrl: $status, \n}''';
  }
}
