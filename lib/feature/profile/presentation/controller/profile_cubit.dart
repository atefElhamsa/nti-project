import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nti_project/feature/profile/presentation/controller/profile_state.dart';

import '../../data/model/profile_services.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileInitial());
  ProfileServices profileServices = ProfileServices();
  getProfileCubit() async {
    emit(ProfileLoading());
    try {
      var user = await profileServices.getProfileData();
      emit(GetProfileSuccess(profileModel: user));
    } catch (e) {
      emit(GetProfileFailure(message: e.toString()));
    }
  }
}
