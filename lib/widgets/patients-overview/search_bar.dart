import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:health_appointment_app/helpers/input_helper.dart';
import 'package:provider/provider.dart';

import '../../providers/patients_provider.dart';
import '../../theme/app_colors.dart';

class SearchBar extends StatefulWidget {
  const SearchBar({super.key});

  @override
  State<SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  static const _placeholderText = 'Search your patients';

  void onSubmit(String query) {
    context.read<Patients>().filterPatients(query);
  }

  @override
  Widget build(BuildContext context) {
    const searchIcon = Icon(
      CupertinoIcons.search,
      size: 30,
      color: AppColors.iconColor,
    );

    return TextField(
      onSubmitted: (value) => onSubmit(value),
      onTapOutside: (event) => FocusScope.of(context).unfocus(),
      textInputAction: TextInputAction.search,
      maxLines: 1,
      decoration: InputHelper.createInputDecoration(
        context,
        prefixIcon: searchIcon,
        placeholderText: _placeholderText,
      ),
    );
  }
}
