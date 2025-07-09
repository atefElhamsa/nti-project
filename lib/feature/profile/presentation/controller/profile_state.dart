import 'package:nti_project/feature/profile/data/model/profile_model.dart';

sealed class ProfileState {}

final class ProfileInitial extends ProfileState {}

final class EditState extends ProfileState {}

final class ProfileLoading extends ProfileState {}

final class DeleteProfileSuccess extends ProfileState {
  final String message;
  DeleteProfileSuccess({required this.message});
}

final class DeleteProfileFailure extends ProfileState {
  final String message;
  DeleteProfileFailure({required this.message});
}

final class GetProfileFailure extends ProfileState {
  final String message;
  GetProfileFailure({required this.message});
}

final class GetProfileSuccess extends ProfileState {
  final ProfileModel profileModel;
  GetProfileSuccess({required this.profileModel});
}
