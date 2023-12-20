import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../exception/loading_exception.dart';
import '../models/User.dart';

class GetUser {
  Future<User> getUserData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? id = prefs.getString('userId');

    final response = await http.get(
      Uri.parse(dotenv.env['USER_URL'].toString() + id.toString()),
    );
    User data = User.fromJson(json.decode(response.body)["result"]);
    if (response.statusCode == 200) {
      return data;
    } else {
      throw Exception('Failed');
    }
  }

  Future<dynamic> userExit() async {
    final response = await http.get(
      Uri.parse(dotenv.env['USER_URL'].toString()),
    );
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? email = prefs.getString('email');
    var data = json.decode(response.body)["result"];
    var contains = data.map((e) => e['email']).contains(email);

    if (response.statusCode == 200) {
      if (contains) {
        var currentUser = data.where((e) => e['email'] == email).toList();
        var currentEmail = currentUser.map((e) => e['_id']).toList();
        prefs.setString('userId', currentEmail[0]);
        print('data=== ${prefs.getString('userId')}');
      } else {
        prefs.remove('token');
      }
    } else {
      throw Exception('Failed');
    }
  }

  Future<void> updateUser(String name, String email, String phoneNum) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? id = prefs.getString('userId');

    try {
      final response = await http.put(
          Uri.parse(dotenv.env['USER_URL'].toString() + id.toString()),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode(
            <String, String>{"name": name, "email": email, "phone": phoneNum},
          ));
      final result = jsonDecode(response.body);
      if (response.statusCode != 200) {
        // print(errMsg);
        print(result);
        // throw Exception(httpErrorHandler(response));
      }

      if (result.isEmpty) {
        throw LoadingException('Something went wrong');
      }
      print('----${result}');
      return result;
    } catch (e) {
      print(e);
    }
  }
}
