import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nti_project/core/shared_widgets/custom_failure.dart';
import 'package:nti_project/core/shared_widgets/custom_loading.dart';
import 'package:nti_project/feature/profile/presentation/controller/profile_cubit.dart';

import '../../controller/profile_state.dart';

class ProfileBody extends StatelessWidget {
  const ProfileBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileCubit, ProfileState>(
      builder: (context, state) {
        if (state is ProfileLoading) {
          return const CustomLoading();
        } else if (state is GetProfileFailure) {
          return CustomFailure(error: state.message);
        } else if (state is GetProfileSuccess) {
          final profileModel = state.profileModel;
          return Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 50,
                  backgroundImage: NetworkImage(profileModel.profileImage),
                ),
                Text(profileModel.name),
                Text(profileModel.email),
                Text(profileModel.phone),
                Text(profileModel.nationalId),
                Text(profileModel.gender),
              ],
            ),
          );
        }
        return const SizedBox();
      },
    );
  }
}
