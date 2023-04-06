import 'package:flutter/material.dart';

class AppointmentDetailsForm extends StatelessWidget {
  const AppointmentDetailsForm({super.key});

  void save(BuildContext context) async {
    // ignore: avoid_print
    print('Not yet implemented...');

    final popContextDelegate = Navigator.of(context).pop;

    bool result = await showDialog(
            context: context,
            builder: (_) {
              return AlertDialog(
                title: const Text('Save changes?'),
                content: const Text(
                  'Do you want to save the changes made to this appointment?',
                ),
                titleTextStyle: Theme.of(context).textTheme.titleLarge?.copyWith(fontSize: 20),
                contentTextStyle: Theme.of(context).textTheme.titleMedium?.copyWith(fontSize: 17),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.pop(context, true),
                    child: const Text('Save'),
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Spacer(),
        Container(
          height: 60,
          width: double.infinity,
          margin: const EdgeInsets.all(10),
          child: ElevatedButton(
            onPressed: () => save(context),
            child: const Text(
              'Save',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.5,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
