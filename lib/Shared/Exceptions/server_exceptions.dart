import 'dart:convert';
import '../../Models/Error_Server_Model/error_server_model.dart';
import 'package:http/http.dart' as http;

class ServerExceptions implements Exception {
  final ErrorServerModel errorServerModel;

  ServerExceptions({required this.errorServerModel});

  static void handleHttpException(http.Response error) {
    final json = jsonDecode(error.body);
    if (error.statusCode == 400) {
      //Bad Request
      throw ServerExceptions(
        errorServerModel: ErrorServerModel.fromJson(json),
      );
    } else if (error.statusCode == 401) {
      //Unauthorized
      throw ServerExceptions(
        errorServerModel: ErrorServerModel.fromJson(json),
      );
    } else if (error.statusCode == 429) {
      // Too Many Requests
      throw ServerExceptions(
        errorServerModel: ErrorServerModel.fromJson(json),
      );
    } else if (error.statusCode == 500) {
      // Server Error
      throw ServerExceptions(
        errorServerModel: ErrorServerModel.fromJson(json),
      );
    }
  }
}
