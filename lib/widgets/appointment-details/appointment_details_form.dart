import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/appointment.dart';
import '../../providers/auth_provider.dart';
import './date_input_field.dart';
import './doctor_input_field.dart';
import 'time_input_field.dart';

class AppointmentDetailsForm extends StatefulWidget {
  final Appointment appointment;

  const AppointmentDetailsForm({
    super.key,
    required this.appointment,
  });

  @override
  State<AppointmentDetailsForm> createState() => _AppointmentDetailsFormState();
}

class _AppointmentDetailsFormState extends State<AppointmentDetailsForm> {
  final _dateController = TextEditingController();
  final _doctorController = TextEditingController();
  final _startTimeController = TextEditingController();
  final _endTimeController = TextEditingController();

  late DateTime lowerEndDateTime;
  late DateTime upperStartDateTime;

  @override
  void initState() {
    super.initState();

    lowerEndDateTime = widget.appointment.dateTime;
    upperStartDateTime = lowerEndDateTime.add(widget.appointment.duration);
  }

  @override
  void dispose() {
    super.dispose();
    _dateController.dispose();
  }

  void updateLowerEndDateTime(DateTime newDateTime) {
    setState(() {
      lowerEndDateTime = newDateTime;
    });
  }

  void updateUpperStartDateTime(DateTime newDateTime) {
    setState(() {
      upperStartDateTime = newDateTime;
    });
  }

  /// not finished
  void save(BuildContext context) async {
    final popContextDelegate = Navigator.of(context).pop;

    bool result = await showDialog(
            context: context,
            builder: (_) {
              return AlertDialog(
                title: const Text('Save changes?'),
                content: const Text(
                  'Do you want to save the changes made to this appointment?',
                ),
                titleTextStyle: Theme.of(context).textTheme.titleLarge?.copyWith(fontSize: 20),
                contentTextStyle: Theme.of(context).textTheme.titleMedium?.copyWith(fontSize: 17),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.pop(context, true),
                    child: const Text('Save'),
                  ),
                  TextButton(
                    onPressed: () => Navigator.pop(context, false),
                    child: const Text('Cancel'),
                  ),
                ],
              );
            }) ??
        false;

    if (result) {
      popContextDelegate();
    }
  }

  Column _buildDateField(
    BuildContext context, {
    Widget titleAndFieldDivider = const SizedBox(height: 5),
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4.0),
          child: Text(
            'Date',
            style: Theme.of(context).textTheme.titleSmall,
          ),
        ),
        titleAndFieldDivider,
        DateInputField(
          dateTime: widget.appointment.dateTime,
          controller: _dateController,
        ),
      ],
    );
  }

  Column _buildTimeField(
    BuildContext context, {
    required DateTime dateTime,
    required DateTime maxDateTime,
    required DateTime minDateTime,
    required Function(DateTime) updateParentState,
    required String label,
    required double width,
    required TextEditingController controller,
    Widget titleAndFieldDivider = const SizedBox(height: 5),
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4.0),
          child: Text(
            label,
            style: Theme.of(context).textTheme.titleSmall,
          ),
        ),
        titleAndFieldDivider,
        SizedBox(
          width: width,
          child: TimeInputField(
            controller: controller,
            dateTime: dateTime,
            maxDateTime: maxDateTime,
            minDateTime: minDateTime,
            updateParentState: updateParentState,
          ),
        ),
      ],
    );
  }

  Column _buildDoctorField(
    BuildContext context, {
    SizedBox titleAndFieldDivider = const SizedBox(height: 5),
  }) {
    final doctor = context.read<Auth>().userData;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4.0),
          child: Text(
            'Doctor',
            style: Theme.of(context).textTheme.titleSmall,
          ),
        ),
        titleAndFieldDivider,
        DoctorInputField(
          doctor: doctor,
          controller: _doctorController,
        ),
      ],
    );
  }

  Container _buildSaveButton(
    BuildContext context, {
    double? height,
    EdgeInsetsGeometry? margin,
    BoxConstraints? constraints,
  }) {
    return Container(
      constraints: constraints,
      width: double.infinity,
      height: height,
      margin: margin,
      child: ElevatedButton(
        onPressed: () => save(context),
        child: const Text(
          'Save',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.5,
          ),
        ),
      ),
    );
  }

  DateTime resetTimeToMidnight(DateTime dateTime) {
    return dateTime.copyWith(
      microsecond: 0,
      millisecond: 0,
      second: 0,
      minute: 0,
      hour: 0,
    );
  }

  @override
  Widget build(BuildContext context) {
    // keeping it within a 1 day range
    final lowerStartDateTime = resetTimeToMidnight(widget.appointment.dateTime);
    final upperEndDateTime = lowerStartDateTime.add(const Duration(days: 1));

    const separator = SizedBox(height: 15);
    const titleAndFieldSeparator = SizedBox(height: 5);

    const saveButtonHeight = 60.0;
    const saveButtonMargin = EdgeInsets.fromLTRB(10, 10, 10, 10);

    return LayoutBuilder(builder: (context, constraints) {
      final timeInputWidth = constraints.maxWidth / 2 - 20;

      // in case of keyboard breaking the view
      bool ignoreButtonSize =
          0 >= constraints.maxHeight - saveButtonHeight - saveButtonMargin.vertical;

      final formHeight = ignoreButtonSize
          ? constraints.maxHeight
          : constraints.maxHeight - saveButtonHeight - saveButtonMargin.vertical;

      return Column(
        children: [
          Container(
            height: formHeight,
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: ListView(
              children: [
                _buildDateField(
                  context,
                  titleAndFieldDivider: titleAndFieldSeparator,
                ),
                separator,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildTimeField(
                      context,
                      label: 'Time from',
                      dateTime: widget.appointment.dateTime,
                      minDateTime: lowerStartDateTime,
                      maxDateTime: upperStartDateTime,
                      controller: _startTimeController,
                      width: timeInputWidth,
                      titleAndFieldDivider: titleAndFieldSeparator,
                      updateParentState: updateLowerEndDateTime,
                    ),
                    _buildTimeField(
                      context,
                      label: 'Time to',
                      dateTime: widget.appointment.dateTime.add(widget.appointment.duration),
                      minDateTime: lowerEndDateTime,
                      maxDateTime: upperEndDateTime,
                      controller: _endTimeController,
                      width: timeInputWidth,
                      titleAndFieldDivider: titleAndFieldSeparator,
                      updateParentState: updateUpperStartDateTime,
                    ),
                  ],
                ),
                separator,
                _buildDoctorField(
                  context,
                  titleAndFieldDivider: titleAndFieldSeparator,
                ),
              ],
            ),
          ),
          _buildSaveButton(
            context,
            height: saveButtonHeight,
            margin: saveButtonMargin,
          ),
        ],
      );
    });
  }
}


// return ListView(
//   children: [
//     SingleChildScrollView(
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           dateField(context),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               startTimeField(context, timeInputWidth),
//               endTimeField(context, timeInputWidth),
//             ],
//           ),
//           doctorField(context),
//         ],
//       ),
//     ),
//     const Spacer(),
//     saveButton(context),
//   ],
// );




// not needed any more?

// Column _buildStartTimeField(
//     BuildContext context, {
//     required double width,
//     Widget titleAndFieldDivider = const SizedBox(height: 5),
//   }) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 4.0),
//           child: Text(
//             'Time from',
//             style: Theme.of(context).textTheme.titleSmall,
//           ),
//         ),
//         titleAndFieldDivider,
//         SizedBox(
//           width: width,
//           child: TimeInputField(
//             dateTime: widget.appointment.dateTime,
//             controller: _startTimeController,
//           ),
//         ),
//       ],
//     );
//   }

//   Column _buildEndTimeField(
//     BuildContext context, {
//     required double width,
//     Widget titleAndFieldDivider = const SizedBox(height: 5),
//   }) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 4.0),
//           child: Text(
//             'Time to',
//             style: Theme.of(context).textTheme.titleSmall,
//           ),
//         ),
//         titleAndFieldDivider,
//         SizedBox(
//           width: width,
//           child: TimeInputField(
//             dateTime: widget.appointment.dateTime.add(widget.appointment.duration),
//             controller: _endTimeController,
//           ),
//         ),
//       ],
//     );
//   }