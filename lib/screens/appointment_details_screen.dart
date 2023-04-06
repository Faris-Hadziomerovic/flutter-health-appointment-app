import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import '../models/appointment.dart';
import '../widgets/appointment-details/appointment_details_form.dart';
import '../widgets/shared/appointment_schedule_info.dart';

class AppointmentDetailsScreen extends StatelessWidget {
  static const routeName = '/appointment-details';

  const AppointmentDetailsScreen({super.key});

  Future<void> deleteAppointment(BuildContext context) async {
    final popContextDelegate = Navigator.of(context).pop;

    bool result = await showDialog(
            context: context,
            builder: (_) {
              return AlertDialog(
                title: const Text('Delete appointment?'),
                content: const Text(
                  'Do you want to delete this appointment? \n\nThis action cannot be reverted.',
                ),
                titleTextStyle: Theme.of(context).textTheme.titleLarge?.copyWith(fontSize: 20),
                contentTextStyle: Theme.of(context).textTheme.titleMedium?.copyWith(fontSize: 17),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.pop(context, true),
                    child: const Text('Delete'),
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
      body: const AppointmentDetailsForm(),
    );
  }
}
