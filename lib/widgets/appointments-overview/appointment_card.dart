import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../enums/appointment_status.dart';
import '../../models/appointment.dart';
import '../../providers/auth_provider.dart';
import '../../screens/appointment_details_screen.dart';
import '../../theme/app_colors.dart';
import '../shared/appointment_schedule_info.dart';

class AppointmentCard extends StatelessWidget {
  final Appointment appointment;

  static const Map<AppointmentStatus, Map<String, Object>> statusMap = {
    AppointmentStatus.active: {
      'status': 'Active',
      'color': AppColors.activeLabelColor,
    },
    AppointmentStatus.complete: {
      'status': 'Complete',
      'color': AppColors.completedLabelColor,
    },
  };

  const AppointmentCard({super.key, required this.appointment});

  bool get isActive => appointment.status == AppointmentStatus.active;

  String getStatusLabel(AppointmentStatus? appointmentStatus) {
    switch (appointmentStatus) {
      case AppointmentStatus.active:
        return 'Active';
      case AppointmentStatus.complete:
        return 'Complete';
      default:
        return 'Error';
    }
  }

  Color getStatusColor(AppointmentStatus? appointmentStatus) {
    switch (appointmentStatus) {
      case AppointmentStatus.active:
        return AppColors.activeLabelColor;
      case AppointmentStatus.complete:
        return AppColors.completedLabelColor;
      default:
        return AppColors.errorColor;
    }
  }

  void navigateToAppointmentDetails(context) {
    Navigator.of(context).pushNamed(
      AppointmentDetailsScreen.routeName,
      arguments: appointment,
    );
  }

  @override
  Widget build(BuildContext context) {
    final doctor = context.read<Auth>().userData;

    return Card(
      clipBehavior: Clip.hardEdge,
      child: Stack(
        children: [
          ListTile(
            onTap: () => navigateToAppointmentDetails(context),
            enabled: isActive,
            contentPadding: const EdgeInsets.symmetric(
              vertical: 10,
              horizontal: 20,
            ),
            title: AppointmentScheduleInfo(
              dateTime: appointment.dateTime,
              duration: appointment.duration,
            ),
            subtitle: Padding(
              padding: const EdgeInsets.only(top: 5.0),
              child: Row(
                children: [
                  Text(
                    'doc. ${doctor?.firstName} ${doctor?.lastName}',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  const Spacer(),
                  Text(
                    getStatusLabel(appointment.status),
                    style: Theme.of(context).textTheme.titleSmall?.copyWith(
                          color: getStatusColor(appointment.status),
                        ),
                  ),
                ],
              ),
            ),
          ),
          if (!isActive)
            Positioned(
              top: 0,
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                color: Theme.of(context).disabledColor,
              ),
            ),
        ],
      ),
    );
  }
}
