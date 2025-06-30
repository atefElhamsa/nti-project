import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nti_project/feature/register/presentation/controller/auth_state.dart';

import '../../data/model/auth_services.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());
  AuthServices authServices = AuthServices();
  addUserCubit({
    required String name,
    required String email,
    required String phone,
    required String nationalId,
    required String gender,
    required String password,
  }) async {
    emit(AuthLoading());
    try {
      final data = await authServices.addUser(
        name: name,
        email: email,
        phone: phone,
        nationalId: nationalId,
        gender: gender,
        password: password,
      );
      emit(AddUserSuccess(responseModel: data));
    } catch (e) {
      emit(AddUserFailure(message: e.toString()));
    }
  }
}
