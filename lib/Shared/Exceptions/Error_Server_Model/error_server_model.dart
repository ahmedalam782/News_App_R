import 'package:news_app_route/Shared/network/remote/end_point.dart';

class ErrorServerModel {
  String? status;
  String? code;
  String? message;

  ErrorServerModel({this.status, this.code, this.message});

  factory ErrorServerModel.fromJson(Map<String, dynamic> json) {
    return ErrorServerModel(
      status: json[ApiKey.status],
      code: json[ApiKey.code],
      message: json[ApiKey.message],
    );
  }
}
