import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import '../../constants/placeholders.dart';
import '../../helpers/input_helper.dart';
import '../../models/doctor.dart';
import '../../theme/app_colors.dart';

class DoctorInputField extends StatefulWidget {
  final Doctor? doctor;
  final TextEditingController controller;

  const DoctorInputField({
    super.key,
    required this.doctor,
    required this.controller,
  });

  @override
  State<DoctorInputField> createState() => _DoctorInputFieldState();
}

class _DoctorInputFieldState extends State<DoctorInputField> {
  @override
  void initState() {
    super.initState();

    if (widget.doctor != null) {
      widget.controller.value = TextEditingValue(
        text: '${widget.doctor?.firstName} ${widget.doctor?.lastName}',
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    const personIcon = Icon(
      CupertinoIcons.person,
      size: 30,
      color: AppColors.iconColor,
    );

    return TextField(
      readOnly: true,
      controller: widget.controller,
      decoration: InputHelper.createInputDecoration(
        context,
        prefixIcon: personIcon,
        placeholderText: Placeholders.doctorPicker,
      ),
    );
  }
}

// final String selectedDoctorId;
// final List<Doctor> doctors;

// void _selectDoctor(Doctor newDoctor) {
//   print(newDoctor);
// }

// return DropdownButtonFormField(
//   items: const [
//     DropdownMenuItem(child: Text('doctor 1')),
//     DropdownMenuItem(child: Text('doctor 2')),
//     DropdownMenuItem(child: Text('doctor 3')),
//   ],
//   onChanged: (value) => _selectDoctor(value),
//   decoration: InputHelper.createInputDecoration(
//     context,
//     prefixIcon: personIcon,
//     placeholderText: Placeholders.doctorPicker,
//   ),
// );