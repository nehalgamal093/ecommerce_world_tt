import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

class GetUser {
  Future<dynamic> getUserData() async {
    final response = await http.get(
      Uri.parse(dotenv.env['USER_URL'].toString()),
    );
    var data = json.decode(response.body)["result"];
    if (response.statusCode == 200) {
      print('result data ${data}');
      return data;
    } else {
      throw Exception('Failed');
    }
  }
}
