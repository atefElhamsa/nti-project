import 'dart:convert';
import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:nti_project/feature/register/presentation/controller/auth_state.dart';

import '../../data/model/auth_services.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  static AuthCubit get(context) => BlocProvider.of(context);

  AuthServices authServices = AuthServices();

  ImagePicker imagePicker = ImagePicker();
  File? myPhoto;
  String? profileImage;
  saveImage() async {
    var pickedImage = await imagePicker.pickImage(source: ImageSource.camera);
    myPhoto = File(pickedImage!.path);
    var bytes = myPhoto!.readAsBytesSync();
    profileImage = base64Encode(bytes);
    emit(SaveImageSuccess());
  }

  addUserCubit({
    required String name,
    required String email,
    required String phone,
    required String nationalId,
    required String gender,
    required String password,
    required String profileImage,
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
        profileImage: profileImage,
      );
      emit(AddUserSuccess(responseModel: data));
    } catch (e) {
      emit(AddUserFailure(message: e.toString()));
    }
  }

  loginCubit({required String email, required String password}) async {
    emit(AuthLoading());
    try {
      final data = await authServices.login(password: password, email: email);
      emit(LoginSuccess(responseModel: data));
    } catch (e) {
      emit(LoginFailure(message: e.toString()));
    }
  }
}
