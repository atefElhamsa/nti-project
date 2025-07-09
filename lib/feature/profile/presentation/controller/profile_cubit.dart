import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nti_project/feature/profile/presentation/controller/profile_state.dart';

import '../../data/model/profile_services.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileInitial());
  TextEditingController profileNameController = TextEditingController();
  TextEditingController profilePhoneController = TextEditingController();
  TextEditingController profileEmailController = TextEditingController();
  TextEditingController profileNationalIdController = TextEditingController();
  TextEditingController profileGenderController = TextEditingController();
  static ProfileCubit get(context) => BlocProvider.of(context);
  ProfileServices profileServices = ProfileServices();

  Map<String, bool> isEditMap = {
    "name": true,
    "email": true,
    "phone": true,
    "nationalId": true,
    "gender": true,
  };

  changeEdit({required String key}) {
    isEditMap[key] = !isEditMap[key]!;
    emit(EditState());
    getProfileCubit();
  }

  getProfileCubit() async {
    emit(ProfileLoading());
    try {
      var user = await profileServices.getProfileData();
      emit(GetProfileSuccess(profileModel: user));
    } catch (e) {
      emit(GetProfileFailure(message: e.toString()));
    }
  }

  updateProfileCubit({required String key, required String value}) {
    emit(ProfileLoading());
    profileServices.updateProfile(key: key, value: value);
    isEditMap[key] = true;
    getProfileCubit();
  }

  deleteProfileCubit() async {
    emit(ProfileLoading());
    try {
      final response = await profileServices.deleteProfile();
      print(response.data);
      emit(DeleteProfileSuccess(message: "Profile Deleted Successfully"));
    } catch (e) {
      emit(DeleteProfileFailure(message: e.toString()));
    }
  }
}
