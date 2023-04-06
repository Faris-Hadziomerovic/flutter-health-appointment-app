
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../constants/formats.dart';
import '../../constants/placeholders.dart';
import '../../helpers/input_helper.dart';
import '../../theme/app_colors.dart';

class DateInputField extends StatefulWidget {
  final DateTime dateTime;
  final TextEditingController controller;

  const DateInputField({
    super.key,
    required this.dateTime,
    required this.controller,
  });

  @override
  State<DateInputField> createState() => _DateInputFieldState();
}

class _DateInputFieldState extends State<DateInputField> {
  @override
  void initState() {
    super.initState();

    widget.controller.value = TextEditingValue(
      text: DateFormat(Formats.date).format(widget.dateTime),
    );
  }

  Future<void> _showDatePicker() async {
    final currentDate = DateTime.now();

    final newDate = await showDatePicker(
          context: context,
          initialDate: currentDate,
          firstDate: currentDate,
          lastDate: currentDate.add(const Duration(days: 365)),
        ) ??
        currentDate;

    widget.controller.value = TextEditingValue(
      text: DateFormat(Formats.date).format(newDate),
    );
  }

  @override
  Widget build(BuildContext context) {
    const calendarIcon = Icon(
      Icons.calendar_today_rounded,
      size: 30,
      color: AppColors.iconColor,
    );

    return TextField(
      readOnly: true,
      controller: widget.controller,
      onTap: () => _showDatePicker(),
      decoration: InputHelper.createInputDecoration(
        context,
        prefixIcon: calendarIcon,
        placeholderText: Placeholders.datePicker,
      ),
    );
  }
}
