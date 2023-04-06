import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import '../../models/patient.dart';
import '../../providers/auth_provider.dart';
import '../../screens/appointments_overview_screen.dart';
import '../../theme/app_colors.dart';
import '../shared/qr_code.dart';
import '../shared/user_icon.dart';

class PatientCard extends StatelessWidget {
  final Patient patient;

  const PatientCard({super.key, required this.patient});

  Future<void> showQrCodeDialog(BuildContext context, {double size = 250}) async {
    return await showDialog(
      barrierColor: AppColors.overlayColor,
      context: context,
      builder: ((ctx) {
        return AlertDialog(
          content: Container(
            width: size,
            height: size,
            alignment: Alignment.center,
            child: QrCode(
              data: patient.id,
            ),
          ),
        );
      }),
    );
  }

  void navigateToAppointments(context) {
    Navigator.of(context).pushNamed(AppointmentsOverviewScreen.routeName, arguments: patient);
  }

  @override
  Widget build(BuildContext context) {
    final imageUrl = context.read<Auth>().userData.profileImageUrl;

    return Card(
      clipBehavior: Clip.hardEdge,
      child: ListTile(
        onTap: () => navigateToAppointments(context),
        contentPadding: const EdgeInsets.symmetric(
          vertical: 12,
          horizontal: 10,
        ),
        leading: UserIcon(
          radius: 30,
          imageUrl: imageUrl,
          // imageUrl: patient.profileImageUrl,
        ),
        title: Text(
          '${patient.firstName} ${patient.lastName}',
          style: Theme.of(context).textTheme.titleSmall,
        ),
        subtitle: Text(patient.id),
        trailing: Padding(
          padding: const EdgeInsets.only(
            right: 5,
            bottom: 15,
          ),
          child: IconButton(
            onPressed: () => showQrCodeDialog(context),
            icon: const Icon(
              CupertinoIcons.qrcode_viewfinder,
              size: 40,
              color: AppColors.activeLabelColor,
            ),
          ),
        ),
      ),
    );
  }
}
