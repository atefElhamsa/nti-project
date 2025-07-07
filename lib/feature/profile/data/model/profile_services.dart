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
    print(data);
    var model = ProfileModel.fromJson(data);
    print(model);
    return model;
  }
}
