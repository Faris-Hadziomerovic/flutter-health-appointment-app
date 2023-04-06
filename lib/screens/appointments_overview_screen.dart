import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:health_appointment_app/widgets/appointments-overview/appointment_card.dart';
import 'package:provider/provider.dart';

import '../models/patient.dart';
import '../providers/appointments_provider.dart';

class AppointmentsOverviewScreen extends StatelessWidget {
  static const routeName = '/appointments-overview';

  const AppointmentsOverviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final patient = ModalRoute.of(context)?.settings.arguments as Patient;

    final appointments = context.read<Appointments>().getAppointmentsByDoctorAndPatientId(
          doctorId: patient.doctorId,
          patientId: patient.id,
        )..sort(((a, b) => b.dateTime.compareTo(a.dateTime)));

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back_rounded),
        ),
        title: Text('${patient.firstName} ${patient.lastName}'),
        actions: [
          Container(
            padding: const EdgeInsets.only(
              right: 15.0,
              bottom: 5,
            ),
            child: IconButton(
              onPressed: () {},
              icon: Icon(
                CupertinoIcons.delete,
                color: Theme.of(context).colorScheme.error,
              ),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: appointments
              .map((appointment) => AppointmentCard(
                    appointment: appointment,
                  ))
              .toList(),
        ),
      ),
    );
  }
}
