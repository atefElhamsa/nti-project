import 'package:dio/dio.dart';
import 'package:nti_project/core/cache/cash_helper.dart';
import 'package:nti_project/feature/profile/data/model/profile_model.dart';

class ProfileServices {
  final Dio dio = Dio();
  getProfileData() async {
    final response = await dio.post(
      "https://elwekala.onrender.com/user/profile",
      data: {"token": CashHelper.getData(key: "token")},
    );
    var data = response.data["user"];
    var model = ProfileModel.fromJson(data);
    return model;
  }

  updateProfile({required String key, required String value}) async {
    final response = await dio.put(
      "https://elwekala.onrender.com/user/update",
      data: {
        "token": CashHelper.getData(key: "token"),
        "password": "Atef332004",
        key: value,
      },
    );
  }

  deleteProfile() async {
    final response = await dio.delete(
      "https://elwekala.onrender.com/user/delete",
      data: {
        "token": CashHelper.getData(key: "token"),
        "email": CashHelper.getData(key: "email"),
      },
    );
    print(response);
  }
}
