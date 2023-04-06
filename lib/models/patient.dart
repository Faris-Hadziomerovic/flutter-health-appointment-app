class Patient {
  final String id;
  final String doctorId;
  final String firstName;
  final String lastName;
  final String profileImageUrl;

  const Patient({
    required this.id,
    required this.doctorId,
    required this.firstName,
    required this.lastName,
    required this.profileImageUrl,
  });

  @override
  String toString() {
    return '''{
      patientNumber: $id, 
      doctorId: $doctorId, 
      firstName: $firstName, 
      lastName: $lastName,
      profileImageUrl: $profileImageUrl, \n}''';
  }
}
