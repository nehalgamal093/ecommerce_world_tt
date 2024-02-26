import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Services/http_error_handler.dart';
import '../exception/loading_exception.dart';
import '../models/ResponseModel.dart';
import 'package:http/http.dart' as http;

class LoginRepo {
  // static String? token;
  static String? errMsg;
  Future<ResponseModel> login(String email, String password) async {
    try {
      final response = await http.post(Uri.parse(dotenv.env['LOGIN_URL']!),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode(
              <String, String>{"email": email, "password": password}));
      final result = jsonDecode(utf8.decode(response.bodyBytes));
      ResponseModel responseModel = ResponseModel.fromJson(result);
      if (response.statusCode != 200) {
        errMsg = result['error'];

        throw Exception(httpErrorHandler(response));
      }

      // ignore: unnecessary_null_comparison
      if (responseModel.token != null) {
        String token = responseModel.token;
        String userId = responseModel.id;
        String userRole = responseModel.user.role;
        SharedPreferences prefs = await SharedPreferences.getInstance();
        var saveLogin = prefs.getBool('saveLogin') ?? false;
        prefs.setString('userId', userId);
        prefs.setString('userRole', userRole);
        if (saveLogin) {
          prefs.setString("token", token);
        }
      } else {}

      if (result.isEmpty) {
        errMsg = result['error'];
        throw LoadingException('Something went wrong');
      }

      // print(result);
      return responseModel;
    } catch (e) {
      throw LoadingException('Something went wrong');
    }
  }
}
