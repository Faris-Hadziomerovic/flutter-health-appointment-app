import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../constants/formats.dart';
import '../../helpers/input_helper.dart';
import '../../theme/app_colors.dart';

class TimeInputField extends StatefulWidget {
  final TextEditingController controller;
  final Duration durationOffset;
  final DateTime dateTime;
  final DateTime minDateTime;
  final DateTime maxDateTime;
  final Function updateParentState;

  const TimeInputField({
    super.key,
    required this.controller,
    required this.dateTime,
    required this.minDateTime,
    required this.maxDateTime,
    required this.updateParentState,
    this.durationOffset = const Duration(minutes: 5),
  });

  @override
  State<TimeInputField> createState() => _TimeInputFieldState();
}

class _TimeInputFieldState extends State<TimeInputField> {
  late TimeOfDay timeOfDay;
  late DateTime _dateTime;

  @override
  void initState() {
    super.initState();

    _dateTime = widget.dateTime;
    timeOfDay = TimeOfDay.fromDateTime(widget.dateTime);

    // widget.controller.value = TextEditingValue(
    //   text: DateFormat(Formats.time).format(widget.dateTime),
    // );
  }

  Future<void> _showTimePicker(BuildContext ctx) async {
    final currentDateTime = DateTime.now();

    final newTime = await showTimePicker(
          context: ctx,
          initialTime: TimeOfDay.fromDateTime(currentDateTime),
        ) ??
        TimeOfDay.fromDateTime(currentDateTime);

    widget.controller.value = TextEditingValue(
      text: newTime.toString(),
    );
  }

  void addDuration() {
    setState(() {
      _dateTime = _dateTime.add(widget.durationOffset);
    });

    widget.updateParentState(_dateTime);
  }

  void subtractDuration() {
    setState(() {
      _dateTime = _dateTime.subtract(widget.durationOffset);
    });

    widget.updateParentState(_dateTime);
  }

  /// Returns <b>true</b> if after adding the set duration it still doesn't go above the upper limit.
  bool get canAddDuration => _dateTime.add(widget.durationOffset).isBefore(widget.maxDateTime);

  /// Returns <b>true</b> if after subtracting the set duration it still doesn't go bellow the lower limit.
  bool get canSubtractDuration =>
      _dateTime.subtract(widget.durationOffset).isAfter(widget.minDateTime);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        TextField(
          readOnly: true,
          // controller: widget.controller,
          onTap: () => _showTimePicker(context),
          decoration: InputHelper.createInputDecoration(context),
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: IconButton(
            icon: const Icon(
              Icons.remove_circle_outline_rounded,
              size: 30,
              color: AppColors.iconColor,
            ),
            onPressed: canSubtractDuration ? subtractDuration : null,
          ),
        ),
        Text(
          DateFormat(Formats.time).format(_dateTime),
          style: Theme.of(context).textTheme.titleMedium,
        ),
        Align(
          alignment: Alignment.centerRight,
          child: IconButton(
            icon: const Icon(
              Icons.add_circle_outline_rounded,
              size: 30,
              color: AppColors.iconColor,
            ),
            onPressed: canAddDuration ? addDuration : null,
          ),
        ),
      ],
    );
  }
}
