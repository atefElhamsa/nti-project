import 'package:flutter/material.dart';
import 'package:nti_project/feature/profile/presentation/view/widgets/show_item_profile.dart';

import '../../controller/profile_cubit.dart';

class IsEditTrueWidget extends StatelessWidget {
  const IsEditTrueWidget({
    super.key,
    required this.cubit,
    required this.name,
    required this.email,
    required this.phone,
    required this.nationalId,
    required this.gender,
  });
  final ProfileCubit cubit;
  final String name;
  final String email;
  final String phone;
  final String nationalId;
  final String gender;
  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 20,
      children: [
        ShowItemProfile(cubit: cubit, text: name),
        ShowItemProfile(cubit: cubit, text: email),
        ShowItemProfile(cubit: cubit, text: phone),
        ShowItemProfile(cubit: cubit, text: nationalId),
        ShowItemProfile(cubit: cubit, text: gender),
      ],
    );
  }
}
