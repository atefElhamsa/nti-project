import 'package:flutter/material.dart';
import 'package:nti_project/feature/profile/presentation/view/widgets/show_item_edit_profile.dart';

import '../../controller/profile_cubit.dart';

class IsEditFalseWidget extends StatelessWidget {
  const IsEditFalseWidget({
    super.key,
    required this.cubit,
    required this.hintName,
    required this.hintEmail,
    required this.hintPhone,
    required this.hintNationalId,
    required this.hintGender,
  });
  final ProfileCubit cubit;
  final String hintName;
  final String hintEmail;
  final String hintPhone;
  final String hintNationalId;
  final String hintGender;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 20,
      children: [
        ShowItemEditProfile(
          cubit: cubit,
          hintText: hintName,
          keyboardType: TextInputType.name,
          keyOfValue: "name",
          controller: cubit.profileNameController,
        ),
        ShowItemEditProfile(
          cubit: cubit,
          hintText: hintEmail,
          keyboardType: TextInputType.emailAddress,
          keyOfValue: "email",
          controller: cubit.profileEmailController,
        ),
        ShowItemEditProfile(
          cubit: cubit,
          hintText: hintPhone,
          keyboardType: TextInputType.phone,
          keyOfValue: "phone",
          controller: cubit.profilePhoneController,
        ),
        ShowItemEditProfile(
          cubit: cubit,
          hintText: hintNationalId,
          keyboardType: TextInputType.number,
          keyOfValue: "nationalId",
          controller: cubit.profileNationalIdController,
        ),
        ShowItemEditProfile(
          cubit: cubit,
          hintText: hintGender,
          keyboardType: TextInputType.text,
          keyOfValue: "gender",
          controller: cubit.profileGenderController,
        ),
      ],
    );
  }
}
