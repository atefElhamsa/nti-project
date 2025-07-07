import 'package:nti_project/feature/profile/data/model/profile_model.dart';

class ResponseModel {
  final String message;
  final String status;
  final ProfileModel profileModel;
  ResponseModel({
    required this.message,
    required this.status,
    required this.profileModel,
  });

  factory ResponseModel.fromJson(Map<String, dynamic> json) {
    return ResponseModel(
      message: json['message'] ?? "",
      status: json['status'],
      profileModel: ProfileModel.fromJson(json['user']),
    );
  }
}
