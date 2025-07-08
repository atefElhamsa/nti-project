import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nti_project/core/shared_widgets/custom_failure.dart';
import 'package:nti_project/core/shared_widgets/custom_loading.dart';
import 'package:nti_project/feature/profile/presentation/controller/profile_cubit.dart';
import 'package:nti_project/feature/profile/presentation/view/widgets/is_edit_false_widget.dart';
import 'package:nti_project/feature/profile/presentation/view/widgets/is_edit_true_widget.dart';

import '../../controller/profile_state.dart';

class ProfileBody extends StatefulWidget {
  const ProfileBody({super.key});

  @override
  State<ProfileBody> createState() => _ProfileBodyState();
}

class _ProfileBodyState extends State<ProfileBody> {
  @override
  void initState() {
    super.initState();
    ProfileCubit.get(context).getProfileCubit();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileCubit, ProfileState>(
      builder: (context, state) {
        final cubit = ProfileCubit.get(context);
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
                const SizedBox(height: 20),
                cubit.isEdit
                    ? IsEditTrueWidget(
                        cubit: cubit,
                        name: state.profileModel.name,
                        email: state.profileModel.email,
                        phone: state.profileModel.phone,
                        nationalId: state.profileModel.nationalId,
                        gender: state.profileModel.gender,
                      )
                    : IsEditFalseWidget(
                        cubit: cubit,
                        hintName: state.profileModel.name,
                        hintEmail: state.profileModel.email,
                        hintPhone: state.profileModel.phone,
                        hintNationalId: state.profileModel.nationalId,
                        hintGender: state.profileModel.gender,
                      ),
              ],
            ),
          );
        }
        return const SizedBox();
      },
    );
  }
}
