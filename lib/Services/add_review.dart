import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:world_commerce/exception/loading_exception.dart';
import 'http_error_handler.dart';

class Post {
  Future<void> postReview(
      String review, double rating, String productId) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String token = prefs.getString("token").toString();
      final response = await http.post(
          Uri.parse(dotenv.env['REVIEW_URL'].toString()),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
            "token": token
          },
          body: jsonEncode(
            <String, String>{
              "comment": review,
              "product": productId,
              "rating": '4',
            },
          ));
      final result = jsonDecode(response.body);
      if (response.statusCode != 200) {
        throw Exception(httpErrorHandler(response));
      }

      if (result.isEmpty) {
        throw LoadingException('Something went wrong');
      }

      return result;
    } catch (e) {
      throw Exception('error');
    }
  }
}
