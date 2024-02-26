import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:world_commerce/exception/loading_exception.dart';
import 'http_error_handler.dart';

class AuthService {
  static String? token;
  static String? errMsg;

  Future<void> authPost(dynamic body, String url) async {
    try {
      final response = await http.post(Uri.parse(url),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode(body));
      final result = jsonDecode(utf8.decode(response.bodyBytes));
      if (response.statusCode != 200) {
        errMsg = result['error'];
        // print(errMsg);
        throw Exception(httpErrorHandler(response));
      }

      if (result['token'] != null) {
        token = result['token'];

        SharedPreferences prefs = await SharedPreferences.getInstance();
        var saveLogin = prefs.getBool('saveLogin') ?? false;

        if (saveLogin) {
          prefs.setString("token", token!);
        }
        return result;
      } else {
        null;
      }

      if (result.isEmpty) {
        errMsg = result['error'];
        throw LoadingException('Something went wrong');
      }

      return result;
    } catch (e) {
      rethrow;
    }
  }
}
