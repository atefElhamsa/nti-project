import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:nti_project/feature/register/presentation/controller/auth_state.dart';

import '../../data/model/auth_services.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController nationalIdController = TextEditingController();
  TextEditingController genderController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController emailLoginController = TextEditingController();
  TextEditingController passwordLoginController = TextEditingController();

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

  addUserCubit() async {
    emit(AuthLoading());
    try {
      final data = await authServices.addUser(
        name: nameController.text.trim(),
        email: emailController.text.trim(),
        phone: phoneController.text.trim(),
        nationalId: nationalIdController.text.trim(),
        gender: genderController.text.trim(),
        password: passwordController.text.trim(),
        profileImage: profileImage!,
      );
      emit(AddUserSuccess(responseModel: data));
    } catch (e) {
      emit(AddUserFailure(message: e.toString()));
    }
  }

  loginCubit() async {
    emit(AuthLoading());
    try {
      final data = await authServices.login(
        password: passwordLoginController.text.trim(),
        email: emailLoginController.text.trim(),
      );
      emit(LoginSuccess(responseModel: data));
    } catch (e) {
      emit(LoginFailure(message: e.toString()));
    }
  }
}
