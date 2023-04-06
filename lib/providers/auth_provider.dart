import 'package:flutter/material.dart';

import '../models/doctor.dart';

class Auth with ChangeNotifier {
  final Doctor _userData = const Doctor(
    id: 'DC-1025',
    firstName: 'Faris',
    lastName: 'Hadžiomerović',
    profileImageUrl: 'https://i.ibb.co/frkgwqX/USVisa-Photo.jpg',
  );

  Doctor get userData => _userData;
}
