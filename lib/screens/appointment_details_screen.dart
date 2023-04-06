import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import '../models/appointment.dart';
import '../widgets/shared/appointment_schedule_info.dart';

class AppointmentDetailsScreen extends StatelessWidget {
  static const routeName = '/appointment-details';

  const AppointmentDetailsScreen({super.key});

  void deleteAppointment(BuildContext context) {
    // ignore: avoid_print
    print('Not yet implemented...');
  }

  void save(BuildContext context) {
    // ignore: avoid_print
    print('Not yet implemented...');
  }

  @override
  Widget build(BuildContext context) {
    final appointment = ModalRoute.of(context)?.settings.arguments as Appointment;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back_rounded),
        ),
        title: AppointmentScheduleInfo(
          dateTime: appointment.dateTime,
          duration: appointment.duration,
        ),
        actions: [
          Container(
            padding: const EdgeInsets.only(
              right: 15.0,
              bottom: 5,
            ),
            child: IconButton(
              onPressed: () => deleteAppointment(context),
              icon: Icon(
                CupertinoIcons.delete,
                color: Theme.of(context).colorScheme.error,
              ),
            ),
          )
        ],
      ),
      body: Column(
        children: [
          const Spacer(),
          ElevatedButton(
            onPressed: () => save(context),
            child: const Text('Save'),
          ),
        ],
      ),
    );
  }
}
