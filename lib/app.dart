import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'providers/appointments_provider.dart';
import 'providers/auth_provider.dart';
import 'providers/doctors_provider.dart';
import 'providers/patients_provider.dart';
import 'screens/appointment_details_screen.dart';
import 'screens/appointments_overview_screen.dart';
import 'screens/patients_overview_screen.dart';
import 'theme/app_theme.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<Auth>(create: (_) => Auth()..login()),
        ChangeNotifierProvider<Doctors>(create: (_) => Doctors()),
        ChangeNotifierProvider<Patients>(create: (_) => Patients()),
        ChangeNotifierProvider<Appointments>(create: (_) => Appointments()),
      ],
      child: MaterialApp(
        title: 'Health Appointments',
        theme: AppTheme.appThemeData,
        home: const PatientsOverviewScreen(),
        routes: {
          PatientsOverviewScreen.routeName: (_) => const PatientsOverviewScreen(),
          AppointmentsOverviewScreen.routeName: (_) => const AppointmentsOverviewScreen(),
          AppointmentDetailsScreen.routeName: (_) => const AppointmentDetailsScreen(),
          // ___Screen.routeName: (_) => const ___Screen(),
        },
      ),
    );
  }
}
