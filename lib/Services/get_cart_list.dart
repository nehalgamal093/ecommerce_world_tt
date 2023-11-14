import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

import '../models/Product.dart';
import '../models/ProductCartModel.dart';
import '../models/ProductModel.dart';

class GetCartList {
  Future<ProductCartModel> fetchCartList() async {
    final response =
        await http.get(Uri.parse(dotenv.env['CART_LIST'].toString()), headers: {
      "token":
          "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJuYW1lIjoiZ2luZ2VyIiwidXNlcklkIjoiNjUxNzEwNDNhMmI1OTk3Njk0ODU0NzRiIiwicm9sZSI6InVzZXIiLCJpYXQiOjE2OTgxNDQ1MzZ9.diGGwpM996BBx_6G7fKOumapMX4INsHB66Gu0SzIqwA"
    });
    ProductCartModel productModel =
        ProductCartModel.fromJson(json.decode(response.body));

    if (response.statusCode == 201) {
      return productModel;
    } else {
      throw Exception('Failed');
    }
  }
}
