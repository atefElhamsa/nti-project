import 'package:dio/dio.dart';
import 'package:nti_project/core/cache/cash_helper.dart';
import 'package:nti_project/feature/register/data/model/response_model.dart';

class AuthServices {
  final Dio dio = Dio();
  addUser({
    required String name,
    required String email,
    required String phone,
    required String nationalId,
    required String gender,
    required String password,
    required String profileImage,
  }) async {
    try {
      var response = await dio.post(
        "https://elwekala.onrender.com/user/register",
        data: {
          "name": name,
          "email": email,
          "phone": phone,
          "nationalId": nationalId,
          "gender": gender,
          "password": password,
          "profileImage": profileImage,
        },
      );
      var data = response.data;
      var model = ResponseModel.fromJson(data);
      return model;
    } on DioException catch (e) {
      if (e.response != null) {
        var error = e.response!.data;
        var model = ResponseModel.fromJson(error);
        return model;
      }
    }
  }

  login({required String email, required String password}) async {
    try {
      var response = await dio.post(
        "https://elwekala.onrender.com/user/login",
        data: {"email": email, "password": password},
      );
      var data = response.data;
      var model = ResponseModel.fromJson(data);
      await CashHelper.saveData(key: "token", value: model.profileModel.token);
      await CashHelper.saveData(key: "email", value: model.profileModel.email);
      return model;
    } on DioException catch (e) {
      if (e.response != null) {
        var error = e.response!.data;
        var model = ResponseModel.fromJson(error);
        return model;
      }
    }
  }
}
