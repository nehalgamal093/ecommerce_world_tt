import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:world_commerce/exception/loading_exception.dart';
import 'http_error_handler.dart';

class AddProductToCart {
  Future<void> addToCart(String productId) async {
    try {
      final response =
          await http.post(Uri.parse(dotenv.env['CART_LIST'].toString()),
              headers: <String, String>{
                'Content-Type': 'application/json; charset=UTF-8',
                "token":
                    "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJuYW1lIjoiZ2luZ2VyIiwidXNlcklkIjoiNjUxNzEwNDNhMmI1OTk3Njk0ODU0NzRiIiwicm9sZSI6InVzZXIiLCJpYXQiOjE2OTgxNDQ1MzZ9.diGGwpM996BBx_6G7fKOumapMX4INsHB66Gu0SzIqwA"
              },
              body: jsonEncode(
                <String, String>{
                  "product": productId,
                },
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
