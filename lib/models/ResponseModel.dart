// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:world_commerce/models/userModel.dart';

class ResponseModel {
  UserModel user;
  String token;
  String message;
  String id;
  ResponseModel(
      {required this.user,
      required this.token,
      required this.message,
      required this.id});
  factory ResponseModel.fromJson(Map<String, dynamic> json) {
    return ResponseModel(
        user: UserModel.fromJson(
          json['user'],
        ),
        token: json['token'],
        message: json['message'],
        id: json['_id']);
  }
}
