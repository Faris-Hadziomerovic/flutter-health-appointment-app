import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../constants/formats.dart';

class AppointmentScheduleInfo extends StatelessWidget {
  final DateTime dateTime;
  final Duration duration;

  const AppointmentScheduleInfo({
    super.key,
    required this.dateTime,
    required this.duration,
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        style: Theme.of(context).textTheme.titleSmall,
        children: [
          TextSpan(
            text: DateFormat(Formats.date).format(dateTime),
            style: Theme.of(context).textTheme.titleSmall?.copyWith(
                  fontWeight: FontWeight.normal,
                ),
          ),
          const TextSpan(text: '  '),
          TextSpan(text: DateFormat(Formats.time).format(dateTime)),
          const TextSpan(text: ' - '),
          TextSpan(
            text: DateFormat(Formats.time).format(dateTime.add(duration)),
          ),
        ],
      ),
    );
  }
}
