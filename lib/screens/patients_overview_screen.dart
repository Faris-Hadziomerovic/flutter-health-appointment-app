import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/doctor.dart';
import '../providers/appointments_provider.dart';
import '../providers/auth_provider.dart';
import '../providers/patients_provider.dart';
import '../widgets/patients-overview/patient_card.dart';
import '../widgets/patients-overview/search_bar.dart';
import '../widgets/shared/user_icon.dart';

class PatientsOverviewScreen extends StatefulWidget {
  static const routeName = '/patients-overview';

  const PatientsOverviewScreen({super.key});

  @override
  State<PatientsOverviewScreen> createState() => _PatientsOverviewScreenState();
}

class _PatientsOverviewScreenState extends State<PatientsOverviewScreen> {
  late final Doctor userData;

  @override
  void initState() {
    super.initState();

    userData = context.read<Auth>().userData;

    context.read<Patients>().fetchPatientsByDoctorId(userData.id);
    context.read<Appointments>().fetchAppointmentsByDoctorId(userData.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Hello',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            Text(
              '${userData.firstName} ${userData.lastName}',
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(15),
            child: UserIcon(
              radius: 25,
              imageUrl: userData.profileImageUrl,
              // imageUrl: 'https://i.ibb.co/frkgwqX/USVisa-Photo.jpg',
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 15.0),
                child: SearchBar(),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4.0),
                child: Text(
                  'Patients',
                  style: Theme.of(context).textTheme.titleSmall,
                ),
              ),
              Consumer<Patients>(
                builder: (_, patientsData, __) => Column(
                  children: [
                    ...patientsData.localPatients.map((patient) => PatientCard(patient: patient)),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
