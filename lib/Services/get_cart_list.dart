import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../models/ProductCartModel.dart';

class GetCartList {
  Future<ProductCartModel> fetchCartList() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString("token").toString();
    final response = await http.get(
        Uri.parse(dotenv.env['CART_LIST'].toString()),
        headers: {"token": token});
    ProductCartModel productModel =
        ProductCartModel.fromJson(json.decode(response.body));

    if (response.statusCode == 201) {
      return productModel;
    } else {
      throw Exception('Failed');
    }
  }
}
