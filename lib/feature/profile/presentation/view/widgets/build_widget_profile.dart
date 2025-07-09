import 'package:flutter/material.dart';
import 'package:nti_project/feature/profile/presentation/view/widgets/show_item_edit_profile.dart';
import 'package:nti_project/feature/profile/presentation/view/widgets/show_item_profile.dart';

import '../../controller/profile_cubit.dart';

class BuildWidgetProfile extends StatelessWidget {
  const BuildWidgetProfile({
    super.key,
    required this.cubit,
    required this.isEditKey,
    required this.text,
    required this.keyboardType,
    required this.controller,
    required this.hintText,
  });
  final ProfileCubit cubit;
  final String isEditKey;
  final String text;
  final TextInputType keyboardType;
  final TextEditingController controller;
  final String hintText;
  @override
  Widget build(BuildContext context) {
    return cubit.isEditMap[isEditKey] ?? true
        ? ShowItemProfile(cubit: cubit, text: text, isEditKey: isEditKey)
        : ShowItemEditProfile(
            cubit: cubit,
            hintText: hintText,
            keyboardType: keyboardType,
            keyOfValue: isEditKey,
            controller: controller,
          );
  }
}
