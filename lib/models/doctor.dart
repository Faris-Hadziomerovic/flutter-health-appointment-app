class Doctor {
  final String id;
  final String firstName;
  final String lastName;
  final String profileImageUrl;

  const Doctor({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.profileImageUrl,
  });

  String toJSON() {
    return '''{
      doctorId: $id, 
      firstName: $firstName, 
      lastName: $lastName,
      profileImageUrl: $profileImageUrl, \n}''';
  }

  @override
  String toString() {
    return '''ID: $id, \nName: $firstName $lastName''';
  }
}
