import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nti_project/feature/favourite/presentation/view/widgets/message_snake_bar.dart';
import 'package:nti_project/feature/register/presentation/view/login_screen.dart';

import '../../../../../core/shared_widgets/custom_loading.dart';
import '../../controller/profile_cubit.dart';
import '../../controller/profile_state.dart';
import 'build_widget_profile.dart';

class InformationAndEditProfileData extends StatelessWidget {
  const InformationAndEditProfileData({
    super.key,
    required this.cubit,
    required this.state,
  });

  final ProfileCubit cubit;
  final GetProfileSuccess state;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      spacing: 20,
      children: [
        BuildWidgetProfile(
          cubit: cubit,
          isEditKey: "name",
          text: state.profileModel.name,
          keyboardType: TextInputType.name,
          controller: cubit.profileNameController,
          hintText: state.profileModel.name,
        ),
        BuildWidgetProfile(
          cubit: cubit,
          isEditKey: "email",
          text: state.profileModel.email,
          keyboardType: TextInputType.emailAddress,
          controller: cubit.profileEmailController,
          hintText: state.profileModel.email,
        ),
        BuildWidgetProfile(
          cubit: cubit,
          isEditKey: "phone",
          text: state.profileModel.phone,
          keyboardType: TextInputType.phone,
          controller: cubit.profilePhoneController,
          hintText: state.profileModel.phone,
        ),
        BuildWidgetProfile(
          cubit: cubit,
          isEditKey: "nationalId",
          text: state.profileModel.nationalId,
          keyboardType: TextInputType.number,
          controller: cubit.profileNationalIdController,
          hintText: state.profileModel.nationalId,
        ),
        BuildWidgetProfile(
          cubit: cubit,
          isEditKey: "gender",
          text: state.profileModel.gender,
          keyboardType: TextInputType.name,
          controller: cubit.profileGenderController,
          hintText: state.profileModel.gender,
        ),
        BlocConsumer<ProfileCubit, ProfileState>(
          listener: (context, state) {
            if (state is ProfileLoading) {
              const CustomLoading();
            }
            if (state is DeleteProfileFailure) {
              messageSnakeBar(
                context: context,
                content: state.message,
                color: Colors.red,
              );
            } else if (state is DeleteProfileSuccess) {
              messageSnakeBar(
                context: context,
                content: state.message,
                color: Colors.green,
              );
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const LoginScreen()),
              );
            }
          },
          builder: (context, state) {
            return state is ProfileLoading
                ? const CustomLoading()
                : TextButton(
                    onPressed: () {
                      cubit.deleteProfileCubit();
                    },
                    child: const Text(
                      "Delete",
                      style: TextStyle(color: Colors.red),
                    ),
                  );
          },
        ),
      ],
    );
  }
}
