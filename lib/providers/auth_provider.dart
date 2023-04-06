import 'package:flutter/material.dart';

import '../data/doctors_data.dart';
import '../models/doctor.dart';

class Auth with ChangeNotifier {
  Doctor? _userData;

  Doctor? get userData => _userData;

  /// Just a method to get data. The real logic is not in focus here.
  Doctor? login({int index = 0}) {
    _userData = DoctorsData.getLoginInfo(index: index);

    notifyListeners();

    return _userData;
  }
}
