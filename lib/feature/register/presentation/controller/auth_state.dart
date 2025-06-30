import '../../data/model/response_model.dart';

sealed class AuthState {}

final class AuthInitial extends AuthState {}

final class AuthLoading extends AuthState {}

final class AddUserSuccess extends AuthState {
  final ResponseModel responseModel;
  AddUserSuccess({required this.responseModel});
}

final class AddUserFailure extends AuthState {
  final String message;
  AddUserFailure({required this.message});
}
